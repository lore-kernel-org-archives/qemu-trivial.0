Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1V3fOL-0004SP-23
	for mharc-qemu-trivial@gnu.org; Mon, 29 Jul 2013 00:49:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58959)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aik@ozlabs.ru>) id 1V3fOD-0004RK-1y
	for qemu-trivial@nongnu.org; Mon, 29 Jul 2013 00:49:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aik@ozlabs.ru>) id 1V3fO6-0003ym-8t
	for qemu-trivial@nongnu.org; Mon, 29 Jul 2013 00:48:56 -0400
Received: from mail-pa0-f43.google.com ([209.85.220.43]:46276)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aik@ozlabs.ru>) id 1V3fO6-0003y2-3I
	for qemu-trivial@nongnu.org; Mon, 29 Jul 2013 00:48:50 -0400
Received: by mail-pa0-f43.google.com with SMTP id hz10so4376824pad.30
	for <qemu-trivial@nongnu.org>; Sun, 28 Jul 2013 21:48:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=ZktANUMwIbdx5KqYksTSk/w22PZ/uTWtPEAWs8iNqkE=;
	b=G3UjIhyidDMypGa/yvZ573dO+N2ldyEIuZglo/P5hquX1FPPrXNSrT9KgJmwqmfo/R
	WXFO7q6zoTIelwY9TwOT5SsbCeYOXoq00FfcIUQihJ4gdMrBiccLnvhoHqfc42unkCzB
	ClrwKZB5/IkqRs0ZA/YbmzeJ3/3j1+/ydRhIJuvPbHDus2SbiKs0af5XTd+xRe5laU40
	ovaFjugPrb48aI75MZAj9gprCosBZ+7N2CC8JoEdFpNsmxFMF96RpVlOsD2mLp5cxYAd
	j2bzTplyXaDy40WGxXB08tp8W60q95aX2/sTLl0yAL5oKJQhaEPUMNZsB6QwX0JgD7BJ
	3Z/A==
X-Received: by 10.66.123.5 with SMTP id lw5mr46265357pab.83.1375073328667;
	Sun, 28 Jul 2013 21:48:48 -0700 (PDT)
Received: from ka1.ozlabs.ibm.com (ibmaus65.lnk.telstra.net. [165.228.126.9])
	by mx.google.com with ESMTPSA id
	il4sm74436860pbb.36.2013.07.28.21.48.44 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 28 Jul 2013 21:48:47 -0700 (PDT)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: qemu-devel@nongnu.org
Date: Mon, 29 Jul 2013 14:48:39 +1000
Message-Id: <1375073319-17488-1-git-send-email-aik@ozlabs.ru>
X-Mailer: git-send-email 1.8.3.2
X-Gm-Message-State: ALoCoQmeXKUsknwgRgx8D+3/CmReTwSGNMSzRzr4BBYrw6Orh3qlybtOmIWIBAzO6BX1OCdtaLTa
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.220.43
Cc: Anthony Liguori <aliguori@us.ibm.com>, Alexey Kardashevskiy <aik@ozlabs.ru>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Alexander Graf <agraf@suse.de>, qemu-trivial@nongnu.org,
	qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Subject: [Qemu-trivial] [PATCH] spapr-vscsi: fix SOLNT bit in SRP_RSP
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
X-List-Received-Date: Mon, 29 Jul 2013 04:49:03 -0000

The driver calculates SOLNT bit from UCSOLNT and  SCSOLNT bits from
the request. The iu pointer has a type of srp_iu* which points to a union,
so cmd and rsp overlap. As the vscsi_send_rsp function calls
memset(iu, 0, sizeof(rsp)), it clears first 36 bytes of both cmd and rsp
so cmd.sol_not is always zero at the moment of calculating rsp.sol_not.

This fixes the bug.

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---

Is that really trivial? I am not so sure but put qemu-trivial@ to copy :)

---

 hw/scsi/spapr_vscsi.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/scsi/spapr_vscsi.c b/hw/scsi/spapr_vscsi.c
index 55b44b9..541ffcc 100644
--- a/hw/scsi/spapr_vscsi.c
+++ b/hw/scsi/spapr_vscsi.c
@@ -217,6 +217,7 @@ static int vscsi_send_rsp(VSCSIState *s, vscsi_req *req,
     union viosrp_iu *iu = &req->iu;
     uint64_t tag = iu->srp.rsp.tag;
     int total_len = sizeof(iu->srp.rsp);
+    uint8_t sol_not = iu->srp.cmd.sol_not;
 
     dprintf("VSCSI: Sending resp status: 0x%x, "
             "res_in: %d, res_out: %d\n", status, res_in, res_out);
@@ -249,7 +250,7 @@ static int vscsi_send_rsp(VSCSIState *s, vscsi_req *req,
     /* Handle success vs. failure */
     iu->srp.rsp.status = status;
     if (status) {
-        iu->srp.rsp.sol_not = (iu->srp.cmd.sol_not & 0x04) >> 2;
+        iu->srp.rsp.sol_not = (sol_not & 0x04) >> 2;
         if (req->senselen) {
             req->iu.srp.rsp.flags |= SRP_RSP_FLAG_SNSVALID;
             req->iu.srp.rsp.sense_data_len = cpu_to_be32(req->senselen);
@@ -257,7 +258,7 @@ static int vscsi_send_rsp(VSCSIState *s, vscsi_req *req,
             total_len += req->senselen;
         }
     } else {
-        iu->srp.rsp.sol_not = (iu->srp.cmd.sol_not & 0x02) >> 1;
+        iu->srp.rsp.sol_not = (sol_not & 0x02) >> 1;
     }
 
     vscsi_send_iu(s, req, total_len, VIOSRP_SRP_FORMAT);
-- 
1.8.3.2


