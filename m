Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E783AC61DC7
	for <qemu-trivial@archiver.kernel.org>; Wed, 26 Aug 2026 21:48:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1wzLSW-0003F2-7x; Wed, 26 Aug 2026 17:47:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wzLSU-0003EP-CG
 for qemu-trivial@nongnu.org; Wed, 26 Aug 2026 17:46:58 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wzLSR-0001JI-Ej
 for qemu-trivial@nongnu.org; Wed, 26 Aug 2026 17:46:58 -0400
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67QKdUSo1483647
 for <qemu-trivial@nongnu.org>; Wed, 26 Aug 2026 21:46:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=hKP24PAIOcpXuIyj4BlE0e
 9sYcbnt4YfH+0nK/M9o7Y=; b=ckb0nsWhO47QRlkfe7n37wGM5D8FFUnbPBsgy+
 Irysb3TFy6HkZhXNz3jWhopCH2BJoQrXzUsgfNtt86kRFVkmL8EsU1RDKZVTlVqm
 sE9dgoxHUQn8zXJmOpz9kctfRzWy1rP7n8FfUXD/J16XssDz37axqE7L0d3svQSs
 Fq2acb3CGe6mWO1wShebWkLnQ/rJdY+5BUzT0AaLJ9NkYJ7+0hFOpL2PaCBTdLdA
 WY0bB5sI5FR0dNMQCR/SjYnwbBNc+2NHjFceBJp3k8/4Ir4ABUwef6A//srRWC44
 MeBQMMblyEj9KiDrxCPrSEV5IblrpOjojgeDBSU2xa2/oXow==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ga6etrcmc-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-trivial@nongnu.org>; Wed, 26 Aug 2026 21:46:53 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-8e9489f62bfso19244086d6.2
 for <qemu-trivial@nongnu.org>; Wed, 26 Aug 2026 14:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787780812; x=1788385612; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=hKP24PAIOcpXuIyj4BlE0e9sYcbnt4YfH+0nK/M9o7Y=;
 b=DIbMjJuw/JiMrRPlWQzhdOpm277KSfwJI6sD5MQmXPDVGQYiZUD22Ph37DM9ZYFtfZ
 4znt5go4pCGoaQT+hVVQKdtjSZInQSH48MEmDsr0YP7py3kZEbc3pU2oh7iAwNAlkYvC
 or1DDOCfmuk3mGazsnvn0tqM4HkZsYSgS6x4FzLEMD4zfAGeVHMcQiVEMAxPH2gKrsAW
 EXJGaxgBNajV0equbAWn0eNQ8bkpDNhFv5QUUDBpdyjULVrgnQDcVpyM0we2MMVkX1s7
 AsOZsiKUAZkWBph0EdvG8YjhBvJ6Zmh7v9TKMEy8MmjEtYezYepzVs1x9k/U8Fj2NZ2Z
 yphg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787780812; x=1788385612;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=hKP24PAIOcpXuIyj4BlE0e9sYcbnt4YfH+0nK/M9o7Y=;
 b=fW9IrisedWr7lCKqX9oGYNGDaSwLwBAqDMzLuAiraY5nbD1oGjR7uLftA3CzP7nzPK
 8h5CFOnMzRQTlJDzr+LoALCXWoK+u4UKEdNb386P9GUNcSx8LwxE0QKJJbwqrpP7Wki7
 4NhISk1UXYyKolfMRwGP4qYojaZS51njUYAYMh0jzbyIXYyZexSQVit9IHge2wc8Ouw2
 sAVouMA5ZcsNioIM3/C7YjkcdxnCk9mLwnPMNFB09mY6WaKEkFVWaf2qHPx7BhLts/IY
 WyuGmEB/vG7OmsZkO63OrLM0B8/I3Ai9riiopv/jNEoWMFDmdnrFtr9/Nz5d5W8mcBz7
 JNrw==
X-Forwarded-Encrypted: i=1;
 AHgh+RqmDhBcVF9TuCQwBCuCXCanCclJ0wY0ZaYBASO94nZOzX8YsTwyFD8Ebxg6Le8BNEOySNh+hBPYZ+4jQjc=@nongnu.org
X-Gm-Message-State: AFuF++kaBjEgZlpp08flZ4hPrOLnipFag0U9iLdJa6BdA5LBWCgqf8Wu
 v3K0gW50uzsve/WbTvje1fT7XeOJJ6+pFlSnkbHSkerOx/M0f0ks31BtFWaRr8i+XtuYfa16/hJ
 fmL5T/7WSTEEf854PpvDD+GOb6g1XsvaS2LqR+1fzVM7CNuUJ0314YVKrn2RQ
X-Gm-Gg: AR+sD12sp5JbvJkIiTiQ86nuarImpwqXrNe3s7k+GosfEzET3Ib0zh357NG9oaDMFtK
 j5u+/aGiSsAkpWknLUPze8kO854ZcZykOamtPJ4ZhEO2oBuveUEGEpvPRSyMjYmiNGcpbHVWR50
 6pGPRYSBp/07xsoyNBfH2/kTC9twM1B8/U7M0mOr+Cp/tdUeRtzBiGjZgqTBmxQKMpuFmEBIoqZ
 XEzrqkyaHmEBDeYSM6Yjjw6JdPrkQOHo/jqXOupLL0/XAXlEfeqzC4k1uUkAFzbSQaCnVvV+6fJ
 jhjBD9UO/uL7lZ+dxwin5yv/ZRGqrGeiSD7bXZ/b66Y8mOffprsl8SlgC2o2ZYT7/mE6HYzvhQu
 CIT8FQ6RyiYrdZnGFx1dEzXGPEQ89vCZsp3BgaA==
X-Received: by 2002:a05:6214:8505:20b0:8ef:e0d0:9fae with SMTP id
 6a1803df08f44-90cccedf05emr61736276d6.14.1787780811930; 
 Wed, 26 Aug 2026 14:46:51 -0700 (PDT)
X-Received: by 2002:a05:6214:8505:20b0:8ef:e0d0:9fae with SMTP id
 6a1803df08f44-90cccedf05emr61735806d6.14.1787780811344; 
 Wed, 26 Aug 2026 14:46:51 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.38.141.232])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-90cd73e4117sm490916d6.24.2026.08.26.14.46.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2026 14:46:50 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 qemu-trivial@nongnu.org (open list:Trivial patches)
Subject: [PATCH v3 00/14] hw/riscv: trivial code dup work (riscv-server-ref
 prep)
Date: Wed, 26 Aug 2026 18:46:28 -0300
Message-ID: <20260826214643.122728-1-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=NrThtcdJ c=1 sm=1 tr=0 ts=6a8f5ecd cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=MCIxunHWmQOg/5OnbzXZaw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=p0WdMEafAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=WX5TnTP1ImDT04Dvd7cA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: MJGWyLfVdbb9GOChIpYBCBtA3rh2xs0z
X-Proofpoint-GUID: MJGWyLfVdbb9GOChIpYBCBtA3rh2xs0z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDE4MyBTYWx0ZWRfX5Q52/G5qRWuu
 K4qYSBviXX95yc1IVZicKq8/uCcesSL5fV3tYDGfDB81Sqbis4aZ2+D6aKXb01kqlLYDDjxTmQW
 eFJS38O8AwlAlVRgJZOgFzbZEEPmfr8sHkAZMnA6yDz5qnVAB39IJdM0OBM6nAShrtyW/6non7/
 3gpCNdR7cPXllVbCVTqZ72k9TlJ5FXiJcZ8wvmnrTQwF3jdiJaOyyLZYxuMHyKl4A3WVAdwtmTv
 X+KShXnWkY4PK5bgF6uoWk/47NyUKzW+fLhOtPA+RpEyE9Cf1iDZlsHkg0XKoIYdeUqQZhmCmob
 R9UspcMAcWL6az5NUpvZ6Ilp0Qr1zH4Nw3PBMuoRP9zeBE6cH8Suib8iLKrdQiAy1egLoD9CZ/3
 xdY/z5J5XGe9AubKNCbOFQj+hhF0EWRLJ/ZfD496JnF+kdiaNvZdcnHcMALE6oUJbjTx2xk36HM
 rlJ9F416rGswidRBJQg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDE4MyBTYWx0ZWRfX5pObEA5fpcEJ
 MCpPSs9AxGQyXhNzpNqeOj8l4QEzokSvQ6auDD2A2NDMz82lCjUextPHTDuTiRZSFR629jlafmw
 4Bd1n2R1/addyoA1MeJb4s5meaSSgTc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_06,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608260183
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
Errors-To: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org
Sender: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org

Hi,


In this version the most noticeable change is the rename of all helpers
that are public APIs, adding a "riscv_" prefix, as suggested by Phil.

Patches based on master.


Original cover:

--------
Here is a bunch of trivial and mostly boring stuff we want to do before
pushing the RISC-V Server Plat Reference board upstream (currently on
v9 [1], not yet sent for review).

Although these changes aim to ease the pain for the riscv-server-ref
review, in the end virt.c was reduced from ~1800 to ~1200 lines, which
is a nice benefit we can have right now.  For riscv-server-ref we went
from ~1450 (v8) to ~770 lines (current v9).

We were able to also reduce tt-atlantis code in one of the patches too.
In fact I think there are opportunities to shrink tt-atlantis board
size, but that will need refactoring logic here and there and this would
fall out of scope for this work.

[1] https://gitlab.com/danielhb/qemu/-/tree/riscv-server-ref_v9
--------

* Changes from v2:
- all patches:
  - added "riscv_" prefix in all public APIs
- patch 1 (new):
  - add a "riscv_" prefix in all existing FDT public APIs
- patch 6:
  - added a break line between .soc and .socket_count
- patch 10:
  - fixed indentation of "google,goldfish-rtc" string
- v2 link: https://lore.kernel.org/qemu-devel/20260826164814.44335-1-daniel.barboza@oss.qualcomm.com/


* Changes from v1:
- patch 8:
  - renamed 'additional_reg_props' to 'uses_32_bit_spacing', as suggested
    by Anirudh
- v1 link: https://lore.kernel.org/qemu-devel/20260825212326.1907-1-daniel.barboza@oss.qualcomm.com/


Daniel Henrique Barboza (14):
  hw/riscv/fdt-common: prepend helpers with "riscv_"
  hw/riscv/fdt-common, virt.c: add riscv_create_fdt_flash()
  hw/riscv/fdt-common, virt.c: add riscv_create_fdt_syscon()
  hw/riscv/fdt-common, virt.c: add riscv_create_fdt_riscv_iommu_sys()
  hw/riscv/fdt_common, virt.c: add riscv_create_fdt_pcie()
  hw/riscv/fdt_common, virt.c: add riscv_create_fdt_imsic()
  hw/riscv/fdt_common, virt.c: add riscv_create_fdt_socket_aplic()
  hw/riscv/fdt-common, virt.c: add riscv_create_fdt_socket_aclint()
  hw/riscv/fdt-common, virt.c, tt_atlantis.c: add
    riscv_create_fdt_uart()
  hw/riscv/fdt-common, virt.c: add riscv_create_fdt_rtc()
  hw/riscv/device-common, virt.c: add riscv_create_platform_bus()
  hw/riscv/device-common, virt.c: add flash helpers
  hw/riscv/device-common, virt.c: add riscv_gpex_pcie_init()
  hw/riscv/riscv-iommu-sys.c, virt.c: add riscv_create_iommu_sys()

 hw/riscv/device-common.c         | 168 ++++++
 hw/riscv/fdt-common.c            | 620 +++++++++++++++++++++-
 hw/riscv/meson.build             |   1 +
 hw/riscv/riscv-iommu-sys.c       |  25 +
 hw/riscv/riscv-iommu.h           |   3 +
 hw/riscv/sifive_u.c              |  34 +-
 hw/riscv/spike.c                 |  30 +-
 hw/riscv/tt_atlantis.c           |  45 +-
 hw/riscv/virt.c                  | 868 +++++--------------------------
 include/hw/riscv/device-common.h |  32 ++
 include/hw/riscv/fdt-common.h    | 145 +++++-
 include/hw/riscv/virt.h          |  15 -
 12 files changed, 1117 insertions(+), 869 deletions(-)
 create mode 100644 hw/riscv/device-common.c
 create mode 100644 include/hw/riscv/device-common.h

-- 
2.43.0


