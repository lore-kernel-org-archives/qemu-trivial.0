Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1r357R-0006ql-U0
	for mharc-qemu-trivial@gnu.org; Tue, 14 Nov 2023 20:55:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jeuk20.kim@samsung.com>)
 id 1r33AR-0006mk-Fa
 for qemu-trivial@nongnu.org; Tue, 14 Nov 2023 18:50:03 -0500
Received: from mailout1.samsung.com ([203.254.224.24])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jeuk20.kim@samsung.com>)
 id 1r33AO-00055E-4y
 for qemu-trivial@nongnu.org; Tue, 14 Nov 2023 18:50:03 -0500
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20231114234950epoutp01879f03bfbdbb03b39176186d286caa0e~XokJT6_IG2129821298epoutp01U
 for <qemu-trivial@nongnu.org>; Tue, 14 Nov 2023 23:49:50 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20231114234950epoutp01879f03bfbdbb03b39176186d286caa0e~XokJT6_IG2129821298epoutp01U
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1700005790;
 bh=mkdh9DEZ36NsR9s3lsgnsXYJtfsYzL7nSyXpelgRy94=;
 h=Subject:Reply-To:From:To:CC:In-Reply-To:Date:References:From;
 b=fGmLESFgqlm1G+TLNqNGfycMf+hN5mAF7Tf61E/VmZXR3XiexRFHeKlVbV/0O4rTc
 CndKD6Q40U+G4jsm3UgLNrY9b4Pcj7MBre26UIlR9Z/UJ8o2hlLH5PZj/CvxDrSKf7
 8ebhEWFvl9tdIf2cqkzSW0xnmqTX6Xhc+w0lM6DM=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas2p3.samsung.com (KnoxPortal) with ESMTP id
 20231114234949epcas2p32f21e7ac7b3fe81c55107b171250da69~XokJE4wGt1853318533epcas2p3p;
 Tue, 14 Nov 2023 23:49:49 +0000 (GMT)
Received: from epsmges2p4.samsung.com (unknown [182.195.36.89]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 4SVNM06vLdz4x9Q3; Tue, 14 Nov
 2023 23:49:48 +0000 (GMT)
X-AuditID: b6c32a48-963ff70000002587-b5-6554079b793f
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
 epsmges2p4.samsung.com (Symantec Messaging Gateway) with SMTP id
 D8.E8.09607.B9704556; Wed, 15 Nov 2023 08:49:47 +0900 (KST)
Mime-Version: 1.0
Subject: Re: [PATCH trivial 14/21] include/block/ufs.h: spelling fix: setted
Reply-To: jeuk20.kim@samsung.com
Sender: Jeuk Kim <jeuk20.kim@samsung.com>
From: Jeuk Kim <jeuk20.kim@samsung.com>
To: Michael Tokarev <mjt@tls.msk.ru>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
CC: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>
X-Priority: 3
X-Content-Kind-Code: NORMAL
In-Reply-To: <20231114165834.2949011-15-mjt@tls.msk.ru>
X-CPGS-Detection: blocking_info_exchange
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20231114234947epcms2p1163a01bff6621621478e9bb3fcc3f58d@epcms2p1>
Date: Wed, 15 Nov 2023 08:49:47 +0900
X-CMS-MailID: 20231114234947epcms2p1163a01bff6621621478e9bb3fcc3f58d
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
X-CPGSPASS: Y
X-CPGSPASS: Y
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrJKsWRmVeSWpSXmKPExsWy7bCmqe5s9pBUg7aXFhYvD2laPPn3ndHi
 eO8OFou1Z+ayOrB4PLm2mcmjb8sqRo8JU5eyBDBHZdtkpCampBYppOYl56dk5qXbKnkHxzvH
 m5oZGOoaWlqYKynkJeam2iq5+AToumXmAG1TUihLzCkFCgUkFhcr6dvZFOWXlqQqZOQXl9gq
 pRak5BSYF+gVJ+YWl+al6+WlllgZGhgYmQIVJmRnbDrTw1bQwVWxYN0BlgbG45xdjJwcEgIm
 EovftjB2MXJxCAnsYJS48mAlSxcjBwevgKDE3x3CIDXCAj4Sk7fNYgOxhQQUJOZs62CHiGtK
 TF8/kQmknE1AXeL0QnMQU0QgXOLyXh2QCmYBc4mV+26zQWzilZjR/pQFwpaW2L58KyOIzQlU
 03jpBFRcQ+LHsl5mCFtU4ubqt+ww9vtj8xkhbBGJ1ntnoWoEJR783A0Vl5Q49e0xK4Q9nVFi
 wX9TkK8kBBYwSvxqng7VoC9xrWMj1Ie+Eq/7wO5kEVCVuH+5nREkLCHgIvF9ZjHE+doSyxa+
 ZgYJMwM9u36XPkSFssSRWywQFXwSHYf/ssM82LDxN1b2jnlPmCBsFYnFzYdZJzAqz0IE8iwk
 u2Yh7FrAyLyKUSy1oDg3PbXYqMAEHq/J+bmbGMFpTstjB+Pstx/0DjEycTAeYpTgYFYS4c3T
 DEgV4k1JrKxKLcqPLyrNSS0+xGgK9OREZinR5Hxgos0riTc0sTQwMTMzNDcyNTBXEue91zo3
 RUggPbEkNTs1tSC1CKaPiYNTqoFpSs+fsHdOEvZSautvWP14Z2a1pvOrV5xkbauU0269/MsT
 Em7zqhv8Pztn/jmFGTp61yeYfNf//ifWh+8gv6b8oeeOz33bJr+vittwxYlbTsueOf7G1bkd
 E8s9Zt76L3Vghqvhr48lf+J+NvzudTSddC6B6zB/y12DB3vO5SitZfyxKPmVzfnz25fkT4sR
 PqfbLbnnmNgXG+suoUwlzhnxb123Trwz1yjJRNAh4LLVid91RalB1yNv3+R8df/jMRezgEz1
 Awe3b3syu2KToGX41tbdd/fV7+z4ZVqy3fsXk8Xy8smL2vft0Y1s9DiiyhpoJBOjm6ItfHFq
 ncbGLb3NoqXv9WuLepndfzA1t11QYinOSDTUYi4qTgQA6Ma8dPwDAAA=
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20231114165848epcas2p32514e61ec8d7181dfade05711610e0df
References: <20231114165834.2949011-15-mjt@tls.msk.ru>
 <20231114165834.2949011-1-mjt@tls.msk.ru>
 <CGME20231114165848epcas2p32514e61ec8d7181dfade05711610e0df@epcms2p1>
Received-SPF: pass client-ip=203.254.224.24;
 envelope-from=jeuk20.kim@samsung.com; helo=mailout1.samsung.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 14 Nov 2023 20:55:03 -0500
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
X-List-Received-Date: Tue, 14 Nov 2023 23:50:03 -0000

On 14/11/2023 17.58, Michael Tokarev wrote:

> Fixes: bc4e68d362ec =22hw/ufs: Initial commit for emulated Universal-Flas=
h-Storage=22
> Cc: Jeuk Kim <jeuk20.kim=40samsung.com>
> Signed-off-by: Michael Tokarev <mjt=40tls.msk.ru>
> ---
> =C2=A0include/block/ufs.h=20=7C=202=20+-=0D=0A>=20=C2=A01=20file=20change=
d,=201=20insertion(+),=201=20deletion(-)=0D=0A>=20=0D=0A>=20diff=20--git=20=
a/include/block/ufs.h=20b/include/block/ufs.h=0D=0A>=20index=200b6ec0814d..=
d61598b8f3=20100644=0D=0A>=20---=20a/include/block/ufs.h=0D=0A>=20+++=20b/i=
nclude/block/ufs.h=0D=0A>=20=40=40=20-657,7=20+657,7=20=40=40=20typedef=20s=
truct=20QEMU_PACKED=20UtpTaskReqDesc=20=7B=0D=0A>=20=C2=A0=23define=20UFS_U=
PIU_MAX_WB_LUN_ID=208=0D=0A>=20=C2=A0=0D=0A>=20=C2=A0/*=0D=0A>=20-=20*=20Wr=
iteBooster=20buffer=20lifetime=20has=20a=20limit=20setted=20by=20vendor.=0D=
=0A>=20+=20*=20WriteBooster=20buffer=20lifetime=20has=20a=20limit=20set=20b=
y=20vendor.=0D=0A>=20=C2=A0=20*=20If=20it=20is=20over=20the=20limit,=20Writ=
eBooster=20feature=20will=20be=20disabled.=0D=0A>=20=C2=A0=20*/=0D=0A>=20=
=C2=A0=23define=20UFS_WB_EXCEED_LIFETIME=200x0B=0D=0A>=20--=C2=A0=0D=0A>=20=
2.39.2=0D=0A=0D=0AReviewed-by:=20Jeuk=20Kim=20<jeuk20.kim=40samsung.com>=0D=
=0A=0D=0AThanks,=0D=0AJeuk=0D=0A

