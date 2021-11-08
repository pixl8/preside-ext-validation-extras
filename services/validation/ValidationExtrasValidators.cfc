/**
 * @validationProvider
 */

 component {

 	public any function init() {
 		variables.SIMPLE_URL_REGEX         = "^https?:\/\/([-_A-Z0-9]+\.)+[-_A-Z0-9]+(\/.*)?$";
		variables.UK_POSTCODE_REGEX        = "^([A-Z][A-HJ-Y]?\d[A-Z\d]? ?\d[A-Z]{2}|GIR ?0A{2})$";
		variables.UK_DRIVING_LICENCE_REGEX = "^[A-Z9]{5}\d[0156]\d([0][1-9]|[12]\d|3[01])\d[A-Z9]{2}\d[A-Z]{2}$";
		variables.UK_PHONE_REGEX           = "^(((\+44\s?\d{4}|\(?0\d{4}\)?)\s?\d{3}\s?\d{3})|((\+44\s?\d{3}|\(?0\d{3}\)?)\s?\d{3}\s?\d{4})|((\+44\s?\d{2}|\(?0\d{2}\)?)\s?\d{4}\s?\d{4}))(\s?\##(\d{4}|\d{3}))?$";

		return this;
	}

	public boolean function requiredIfOtherFieldChecked( required string fieldName, any value="", required struct data, required string otherField, required string checkedValue ) validatorMessage="cms:validation.conditional.required.default" {
		if ( ( arguments.data[ arguments.otherField ] ?: "" ) != arguments.checkedValue ) {
			return true;
		}
		return arguments.data.keyExists( fieldName ) && !IsEmpty( value );
	}
	public string function requiredIfOtherFieldChecked_js() validatorMessage="cms:validation.conditional.required.default" {
		return "function( value, el, params ){ $otherField = $( '[name=' + params[0] + ']:checked' ); if ( !$otherField.length || !$otherField.is( ':checked' ) || ( params[1] != null && $otherField.val() != params[1] ) ) { return true; } return ( value.length > 0 ); }";
	}


	public boolean function requiredIfOtherFieldNotChecked( required string fieldName, any value="", required struct data, required string otherField, required string checkedValue ) validatorMessage="cms:validation.conditional.required.default" {
		if ( ( arguments.data[ arguments.otherField ] ?: "" ) == arguments.checkedValue ) {
			return true;
		}
		return arguments.data.keyExists( fieldName ) && !IsEmpty( value );
	}
	public string function requiredIfOtherFieldNotChecked_js() validatorMessage="cms:validation.conditional.required.default" {
		return "function( value, el, params ){ $otherField = $( '[name=' + params[0] + ']' ); if ( !$otherField.length || $otherField.is( ':checked' ) ) { return true; } return ( value.length > 0 ); }";
	}


	public boolean function requiredIfOtherFieldEmpty( required string fieldName, any value="", required struct data, required string otherField ) validatorMessage="cms:validation.conditional.required.default" {
		if ( len( arguments.data[ arguments.otherField ] ?: "" ) ) {
			return true;
		}
		return arguments.data.keyExists( fieldName ) && !IsEmpty( value );
	}
	public string function requiredIfOtherFieldEmpty_js() validatorMessage="cms:validation.conditional.required.default" {
		return "function( value, el, params ){ $otherField = $( '[name=' + params[0] + ']' ); if ( !$otherField.length || $otherField.val().length ) { return true; } return ( value.length > 0 ); }";
	}


	public boolean function requiredIfOtherFieldNotEmpty( required string fieldName, any value="", required struct data, required string otherField ) validatorMessage="cms:validation.conditional.required.default" {
		if ( !len( arguments.data[ arguments.otherField ] ?: "" ) ) {
			return true;
		}
		return arguments.data.keyExists( fieldName ) && !IsEmpty( value );
	}
	public string function requiredIfOtherFieldNotEmpty_js() validatorMessage="cms:validation.conditional.required.default" {
		return "function( value, el, params ){ $otherField = $( '[name=' + params[0] + ']' ); if ( !$otherField.length || !$otherField.val().length ) { return true; } return ( value.length > 0 ); }";
	}


	public boolean function requiredIfOtherFieldValue( required string fieldName, any value="", required struct data, required string otherField, required string otherFieldValue ) validatorMessage="cms:validation.conditional.required.default" {
		if ( ( arguments.data[ arguments.otherField ] ?: "" ) != arguments.otherFieldValue ) {
			return true;
		}
		return arguments.data.keyExists( fieldName ) && !IsEmpty( value );
	}
	public string function requiredIfOtherFieldValue_js() validatorMessage="cms:validation.conditional.required.default" {
		return "function( value, el, params ){ $otherField = $( '[name=' + params[0] + ']' ); if ( !$otherField.length || $otherField.val() != params[1] ) { return true; } return ( value.length > 0 ); }";
	}


	public boolean function simpleUrl( required string fieldName, any value="" ) validatorMessage="validationExtras:validation.simpleUrl.default" {
		return IsEmpty( arguments.value ) || ReFindNoCase( variables.SIMPLE_URL_REGEX, arguments.value );
	}
	public string function simpleUrl_js() validatorMessage="validationExtras:validation.simpleUrl.default" {
		return "function( value, el, params ){ return !value.length || value.match( /#variables.SIMPLE_URL_REGEX#/i ) !== null }";
	}


	public boolean function ukPhone( required string fieldName, string value="" ) validatorMessage="validationExtras:validation.ukPhone.default" {
		if ( not Len( Trim( arguments.value ) ) ) {
			return true;
		}

		return ReFind( variables.UK_PHONE_REGEX, arguments.value );
	}
	public string function ukPhone_js() {
		return "function( value, el, params ){ return !value.length || value.match( /#variables.UK_PHONE_REGEX#/ ) !== null }";
	}


	public boolean function ukPostcode( required string fieldName, string value="" ) validatorMessage="validationExtras:validation.ukPostcode.default" {
		if ( not Len( Trim( arguments.value ) ) ) {
			return true;
		}

		return ReFindNoCase( variables.UK_POSTCODE_REGEX, arguments.value );
	}
	public string function ukPostcode_js() {
		return "function( value, el, params ){ return !value.length || value.match( /#variables.UK_POSTCODE_REGEX#/i ) !== null }";
	}


	public boolean function ukDrivingLicence( required string fieldName, string value="" ) validatorMessage="validationExtras:validation.ukDrivingLicence.default" {
		if ( not Len( Trim( arguments.value ) ) ) {
			return true;
		}

		return ReFindNoCase( variables.UK_DRIVING_LICENCE_REGEX, arguments.value );
	}
	public string function ukDrivingLicence_js() {
		return "function( value, el, params ){ return !value.length || value.match( /#variables.UK_DRIVING_LICENCE_REGEX#/i ) !== null }";
	}


}