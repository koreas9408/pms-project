package com.project.pms.risk.vo;

import java.util.Date;

public class RiskFileInfo {
	private String rFileId;
	private String riskId;
	private String originalName;
	private String saveName;
	private String extension;
	private long volume;
	private Date createAt;
	private Date updateAt;
	public RiskFileInfo() {

	}
	
	public RiskFileInfo(String rFileId, String riskId, String originalName, String saveName, String extension, long volume,
			Date createAt, Date updateAt) {
		this.rFileId = rFileId;
		this.riskId = riskId;
		this.originalName = originalName;
		this.saveName = saveName;
		this.extension = extension;
		this.volume = volume;
		this.createAt = createAt;
		this.updateAt = updateAt;
	}
	public String getrFileId() {
		return rFileId;
	}
	public void setrFileId(String rFileId) {
		this.rFileId = rFileId;
	}
	public String getRiskId() {
		return riskId;
	}
	public void setRiskId(String riskId) {
		this.riskId = riskId;
	}
	public String getOriginalName() {
		return originalName;
	}
	public void setOriginalName(String originalName) {
		this.originalName = originalName;
	}
	public String getSaveName() {
		return saveName;
	}
	public void setSaveName(String saveName) {
		this.saveName = saveName;
	}
	public String getExtension() {
		return extension;
	}
	public void setExtension(String extension) {
		this.extension = extension;
	}
	public long getVolume() {
		return volume;
	}
	public void setVolume(long volume) {
		this.volume = volume;
	}
	public Date getCreateAt() {
		return createAt;
	}
	public void setCreateAt(Date createAt) {
		this.createAt = createAt;
	}
	public Date getUpdateAt() {
		return updateAt;
	}
	public void setUpdateAt(Date updateAt) {
		this.updateAt = updateAt;
	}

	@Override
	public String toString() {
		return "RiskFileInfo [rFileId=" + rFileId + ", riskId=" + riskId + ", originalName=" + originalName
				+ ", saveName=" + saveName + ", extension=" + extension + ", volume=" + volume + ", createAt="
				+ createAt + ", updateAt=" + updateAt + "]";
	}
	
	
}
