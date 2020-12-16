package io.geek.july.rpcfx.exception;

public class RpcfxException extends RuntimeException {
    private Integer errCode;
    private String errMsg;

    public RpcfxException(int errCode,String errMsg) {
        this.errCode = errCode;
        this.errMsg = errMsg;
    }

    public Integer getErrCode() {
        return errCode;
    }

    public void setErrCode(Integer errCode) {
        this.errCode = errCode;
    }

    public String getErrMsg() {
        return errMsg;
    }

    public void setErrMsg(String errMsg) {
        this.errMsg = errMsg;
    }
}
