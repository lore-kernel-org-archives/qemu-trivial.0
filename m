Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WS74T-0007nn-Ca
	for mharc-qemu-trivial@gnu.org; Mon, 24 Mar 2014 11:45:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60886)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prasadjoshi.linux@gmail.com>) id 1WS74I-0007Yb-QJ
	for qemu-trivial@nongnu.org; Mon, 24 Mar 2014 11:45:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prasadjoshi.linux@gmail.com>) id 1WS74A-0005FV-2t
	for qemu-trivial@nongnu.org; Mon, 24 Mar 2014 11:45:42 -0400
Received: from mail-pb0-x236.google.com ([2607:f8b0:400e:c01::236]:61341)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prasadjoshi.linux@gmail.com>)
	id 1WS73b-0004q1-Sw; Mon, 24 Mar 2014 11:45:00 -0400
Received: by mail-pb0-f54.google.com with SMTP id ma3so5604560pbc.41
	for <multiple recipients>; Mon, 24 Mar 2014 08:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=zIchtVDvLBqL+PS3pGOTXjDpDBK6oP5SFK3dvOnsd64=;
	b=K0wfHoZiSUKDWzitxBZUaZdSBtRLFs61V1YJlvCVNmSARMEq7+mf2+KStSRftFMWXp
	Wjuk0LqPUKViT7o/Hk4rr0It7qaJO43suM+zHDvzd484bBaeUtaZVH+tp1n4GITGMqqd
	irxeOCaKy1mZhCjwPPEM9BIm/2Q+gCQsZ7H0xWSPkrC56dW2D42JGNVq8LYiu6uZBbvl
	hHgBIh9rCUhLCx1A8yLl+smpRNcEb24sWogM1MO3zmd5/tN/WsAYysd06bYNcHayeiGB
	peHxkWfP3Js8dekIUHuiSD4a6J9A0HXTQamTOEut/XA4grO34tjZ5ZWtNLhqYzuplp7u
	ob2w==
X-Received: by 10.66.217.133 with SMTP id oy5mr73596314pac.46.1395675897884;
	Mon, 24 Mar 2014 08:44:57 -0700 (PDT)
Received: from prasad-desktop ([117.195.10.12])
	by mx.google.com with ESMTPSA id
	ps1sm61480770pac.26.2014.03.24.08.44.53 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 24 Mar 2014 08:44:56 -0700 (PDT)
Received: by prasad-desktop (Postfix, from userid 1000)
	id 47065A0042F; Mon, 24 Mar 2014 21:14:48 +0530 (IST)
From: Prasad Joshi <prasadjoshi.linux@gmail.com>
To: prasadjoshi.linux@gmail.com
Date: Mon, 24 Mar 2014 21:14:46 +0530
Message-Id: <1395675886-3357-1-git-send-email-prasadjoshi.linux@gmail.com>
X-Mailer: git-send-email 1.8.1.2
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c01::236
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, agraf@suse.de,
	qemu-ppc@nongnu.org, stefanha@redhat.com, pbonzini@redhat.com
Subject: [Qemu-trivial] [PATCH] spapr_vscsi: remove duplicate condition check
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 24 Mar 2014 15:45:51 -0000

Signed-off-by: Prasad Joshi <prasadjoshi.linux@gmail.com>
---
 hw/scsi/spapr_vscsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/scsi/spapr_vscsi.c b/hw/scsi/spapr_vscsi.c
index 34478f0..d4ada4f 100644
--- a/hw/scsi/spapr_vscsi.c
+++ b/hw/scsi/spapr_vscsi.c
@@ -690,7 +690,7 @@ static void vscsi_inquiry_no_target(VSCSIState *s, vscsi_req *req)
     int rc, len, alen;
 
     /* We dont do EVPD. Also check that page_code is 0 */
-    if ((cdb[1] & 0x01) || (cdb[1] & 0x01) || cdb[2] != 0) {
+    if ((cdb[1] & 0x01) || cdb[2] != 0) {
         /* Send INVALID FIELD IN CDB */
         vscsi_makeup_sense(s, req, ILLEGAL_REQUEST, 0x24, 0);
         vscsi_send_rsp(s, req, CHECK_CONDITION, 0, 0);
-- 
1.8.1.2


