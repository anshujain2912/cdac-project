package com.sentiment;

class ResponseAPI {

	public ResponseAPI() {
	}

	private String result;
	private int status;
	ResponseAPI output;
	
	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public ResponseAPI getOutput() {
		return output;
	}

	public void setOutput(ResponseAPI output) {
		this.output = output;
	}

	@Override
	public String toString() {
		return "ResponseAPI [result=" + result + ", status=" + status + ", output=" + output + "]";
	}
	
	

}
