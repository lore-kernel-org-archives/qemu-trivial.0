Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Sp9LR-000417-Gp
	for mharc-qemu-trivial@gnu.org; Wed, 11 Jul 2012 22:41:33 -0400
Received: from eggs.gnu.org ([208.118.235.92]:47071)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <donald.open@gmail.com>) id 1Sp9LP-00040V-6k
	for qemu-trivial@nongnu.org; Wed, 11 Jul 2012 22:41:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <donald.open@gmail.com>) id 1Sp9LO-0006ry-5c
	for qemu-trivial@nongnu.org; Wed, 11 Jul 2012 22:41:31 -0400
Received: from mail-gh0-f173.google.com ([209.85.160.173]:38997)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <donald.open@gmail.com>)
	id 1Sp9LO-0006rs-1D; Wed, 11 Jul 2012 22:41:30 -0400
Received: by ghrr14 with SMTP id r14so2088984ghr.4
	for <multiple recipients>; Wed, 11 Jul 2012 19:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=t1thKUvIIrLR3ibSrEvfj7g123fBMxtVFbPx2wAgUH0=;
	b=BrHvAlUTrOxchdlr0gopbXtLDJGnf6QH84zWV52vfxIVDBAam9ceDgavJNXKkq1u5q
	PFsWTzfUvKtrb4/upY07suycblIr4f6eghke1y4BX5W9unpKsTiOLPIieinZMMtZ36bf
	1xmptv+me/w/RYEN1bcV+gRanEdWGc29qQHxX9Jeq8HOTVjNQ47fq4oI7DbOcfTFH9g9
	juNeZSXyNximftT4/hRNtsnlgPeFrAKa1jeROrBZ7uVHX+aP9kspKAEp198Lf8UakQRm
	plL9bymPsK1O1XQY7wPQp+JJw5T5s/qI/VV32fQpVo0LW6t72uELdmSUTEV5yg4Xxfbq
	9cmA==
Received: by 10.50.149.170 with SMTP id ub10mr16280028igb.38.1342060887450;
	Wed, 11 Jul 2012 19:41:27 -0700 (PDT)
Received: from localhost.localdomain ([202.108.130.138])
	by mx.google.com with ESMTPS id qo3sm6247051igc.8.2012.07.11.19.41.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 11 Jul 2012 19:41:26 -0700 (PDT)
Sender: Dong Xu Wang <donald.open@gmail.com>
From: Dong Xu Wang <wdongxu@linux.vnet.ibm.com>
To: qemu-trivial@nongnu.org
Date: Thu, 12 Jul 2012 10:40:43 +0800
Message-Id: <1342060843-27453-1-git-send-email-wdongxu@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.7.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.160.173
Cc: qemu-devel@nongnu.org, stefanha@linux.vnet.ibm.com
Subject: [Qemu-trivial] [PATCH] qemu-img: correct help message
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
X-List-Received-Date: Thu, 12 Jul 2012 02:41:32 -0000

qemu-img not only suports k/K/M/G/T/b, but also supports m/g/t/B. So correct
it in help message.

Signed-off-by: Dong Xu Wang <wdongxu@linux.vnet.ibm.com>
---
 qemu-img.c |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/qemu-img.c b/qemu-img.c
index 80cfb9b..533eac2 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -69,8 +69,9 @@ static void help(void)
            "    options are: 'none', 'writeback' (default, except for convert), 'writethrough',\n"
            "    'directsync' and 'unsafe' (default for convert)\n"
            "  'size' is the disk image size in bytes. Optional suffixes\n"
-           "    'k' or 'K' (kilobyte, 1024), 'M' (megabyte, 1024k), 'G' (gigabyte, 1024M)\n"
-           "    and T (terabyte, 1024G) are supported. 'b' is ignored.\n"
+           "    'k' or 'K' (kilobyte, 1024), 'm' or 'M' (megabyte, 1024k),\n"
+           "    'g' or 'G' (gigabyte, 1024M) and 't' or 'T' (terabyte, 1024G) are supported.\n"
+           "    'b' or 'B' is ignored.\n"
            "  'output_filename' is the destination disk image filename\n"
            "  'output_fmt' is the destination format\n"
            "  'options' is a comma separated list of format specific options in a\n"
-- 
1.7.1


