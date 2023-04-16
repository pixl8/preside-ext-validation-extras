# Preside Validation Extras

A collection of useful additional validators for use with Preside's forms system.


## Installation

```box install preside-ext-validation-extras```


## The validators

### requiredIfOtherFieldChecked

Makes a field required if another specified checkbox field is checked.

```xml
<field name="subscribe"     control="checkbox" />
<field name="email_address" control="emailInput">
	<rule validator="requiredIfOtherFieldChecked">
		<param name="otherField"   value="subscribe" />
		<param name="checkedValue" value="1" />
	</rule>
</field>
```

### requiredIfOtherFieldNotChecked

Makes a field required if another specified checkbox field is not checked.

```xml
<field name="use_billing_address" control="checkbox" />
<field name="shipping_address">
	<rule validator="requiredIfOtherFieldNotChecked">
		<param name="otherField"   value="use_billing_address" />
		<param name="checkedValue" value="1" />
	</rule>
</field>
```

### requiredIfOtherFieldEmpty

Makes a field required if another specified field is empty. In this example, at least one of the inputs would have to be filled.

```xml
<field name="input_one">
	<rule validator="requiredIfOtherFieldEmpty">
		<param name="otherField" value="input_two" />
	</rule>
</field>
<field name="input_two">
	<rule validator="requiredIfOtherFieldEmpty">
		<param name="otherField" value="input_one" />
	</rule>
</field>
```

### requiredIfOtherFieldNotEmpty

Makes a field required if another specified field is not empty. In this example, if one input is filled then the other is also required.

```xml
<field name="address">
	<rule validator="requiredIfOtherFieldNotEmpty">
		<param name="otherField" value="postcode" />
	</rule>
</field>
<field name="postcode">
	<rule validator="requiredIfOtherFieldNotEmpty">
		<param name="otherField" value="address" />
	</rule>
</field>
```

### requiredIfOtherFieldValue

Makes a field required if the value of another field matches the specified value. Here, if "Yes" is chosen from the subcribe select control, then the email address is required.

```xml
<field name="subscribe"     control="select" values="yes,no" />
<field name="email_address" control="emailInput">
	<rule validator="requiredIfOtherFieldValue">
		<param name="otherField"      value="subscribe" />
		<param name="otherFieldValue" value="yes" />
	</rule>
</field>
```

### requiredIfOtherFieldMatchSystemLookup
Makes a field required if the value of another field matches systemSetting. In this example, if the ethnicity  value matches the value on systemSetting ( category="lookup", setting="ethnicity_other" ), then the ethnicity_other field will be required
```xml
<field name="ethnicity"       control="objectPicker" object="ethnicity" />
<field name="ethnicity_other" control="textInput">
	<rule validator="requiredIfOtherFieldMatchSystemLookup">
		<param name="otherField" value="ethnicity"       />
		<param name="category"   value="lookup"          />
		<param name="setting"    value="ethnicity_other" />
	</rule>
</field>
```


### simpleUrl

Checks for a simple web URL. Requires either `http://` or `https://` at the start.

```xml
<field name="website_url">
	<rule validator="simpleUrl" />
</field>
```

### ukPhone

Validates a phone number is valid for the UK. Allows brackets, spaces, `+44` or `0` prefix, and an optional extension following a #.

```xml
<field name="telephone">
	<rule validator="ukPhone" />
</field>
```

### ukPostcode

Validates a UK postcode format. Valid with or without a space in the middle.

```xml
<field name="postal_code">
	<rule validator="ukPostcode" />
</field>
```

### ukDrivingLicence

Validates a UK driving licence number.

```xml
<field name="driving_licence">
	<rule validator="ukDrivingLicence" />
</field>
```


# Contributing

Contribution in all forms is very welcome. Use Github to create pull requests for tests, logic, features and documentation. Or, get in touch over at Preside's slack team and we'll be happy to help and chat: [https://presidecms-slack.herokuapp.com/](https://presidecms-slack.herokuapp.com/).