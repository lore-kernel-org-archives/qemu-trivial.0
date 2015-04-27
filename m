Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ymm9z-0004Eg-NV
	for mharc-qemu-trivial@gnu.org; Mon, 27 Apr 2015 12:45:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39326)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1Ymm9m-0003pK-I7
	for qemu-trivial@nongnu.org; Mon, 27 Apr 2015 12:45:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1Ymm9h-0001UN-DR
	for qemu-trivial@nongnu.org; Mon, 27 Apr 2015 12:45:18 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:41152)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1Ymm9h-0001TN-8Z
	for qemu-trivial@nongnu.org; Mon, 27 Apr 2015 12:45:13 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id CB45B20B6B
	for <qemu-trivial@nongnu.org>; Mon, 27 Apr 2015 12:45:12 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
	by compute6.internal (MEProxy); Mon, 27 Apr 2015 12:45:12 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=braap.org; h=cc
	:date:from:in-reply-to:message-id:references:subject:to
	:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=sBsCTUIFmabzoUXLWaRehkH8DnM
	=; b=eL+KhMvoSPZutNzVW5TOF/AIWxbKS3NNnhF6bMPieHt0D3XU7gOVNCs6cYj
	REtysVosk1d47oRzBsMSXlKE1KodpRfgXV46l69bQHL8sSNc+S2L64X+N1FQjlHE
	h4uB5gsVUCJgxZxa2OGKohLHUKlKWcJlj6Y7bA/5dD7JZbJI=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:date:from:in-reply-to:message-id
	:references:subject:to:x-sasl-enc:x-sasl-enc; s=smtpout; bh=sBsC
	TUIFmabzoUXLWaRehkH8DnM=; b=XMs1JiGn3g+a/qY048NDILVMr4I3NTa8XNL3
	+bFgcQmlUUXT+4q/PfSJTPFuar99MKNc3qngcXTPzqP6a1r+N1s0jRGbSCtTb66S
	rLWmJx8SWgKq7JV2JzSYf4F8CQcfMLezrciWhx2yiunGuA7nUgpGiZlptkvYSqwr
	63wVPtM=
X-Sasl-enc: oVanS/gnWdmBByVhSf33ceawBhMYtdDQyN24PJUAAL/M 1430153112
Received: from localhost (unknown [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id 9AB4D680238;
	Mon, 27 Apr 2015 12:45:12 -0400 (EDT)
From: "Emilio G. Cota" <cota@braap.org>
To: qemu-devel@nongnu.org
Date: Mon, 27 Apr 2015 12:45:31 -0400
Message-Id: <1430153133-30988-5-git-send-email-cota@braap.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1430153133-30988-1-git-send-email-cota@braap.org>
References: <1430153133-30988-1-git-send-email-cota@braap.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 66.111.4.25
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH 4/6] gitignore: ignore *.patch files
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
X-List-Received-Date: Mon, 27 Apr 2015 16:45:21 -0000

Signed-off-by: Emilio G. Cota <cota@braap.org>
---
 .gitignore | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.gitignore b/.gitignore
index aed0e1f..025a841 100644
--- a/.gitignore
+++ b/.gitignore
@@ -62,6 +62,7 @@
 *.fn
 *.ky
 *.log
+*.patch
 *.pdf
 *.pod
 *.cps
-- 
1.9.1


