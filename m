Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TGsiL-0002fM-Ap
	for mharc-qemu-trivial@gnu.org; Wed, 26 Sep 2012 10:35:49 -0400
Received: from eggs.gnu.org ([208.118.235.92]:59121)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1TGsiF-0002P3-HE
	for qemu-trivial@nongnu.org; Wed, 26 Sep 2012 10:35:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1TGsiA-0002Za-Vv
	for qemu-trivial@nongnu.org; Wed, 26 Sep 2012 10:35:43 -0400
Received: from mail-pb0-f45.google.com ([209.85.160.45]:64968)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1TGshy-0002Mg-DV; Wed, 26 Sep 2012 10:35:26 -0400
Received: by pbbrp2 with SMTP id rp2so1976356pbb.4
	for <multiple recipients>; Wed, 26 Sep 2012 07:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=Gw3vpcuPH8bt3+NVwrvxFLKEKJGhi2kyQBOKZd4o+Us=;
	b=d3PYpRp1V5/tFapEIov9wKuDzrpUB/LLTsGmIR2GvYnmQBbqwI66baNBpksnAr+91j
	5p/GH6U6MZUHun+oUkqRqxl3L9esuzYn98aeVMIFfb/j6wZakZsF88XPX+OsB7dTWVho
	YaXLPvezFF/wtrXV5fDsyyWAl9KPFmfcppO1DU2xeeDUyuvGjZAsHrJG3yzRMGJI8Cqw
	fWaBulMfOEUJOcm900QkBuLDFNw6MbSNfBzFRTP2J+0lHd5n+AjFuBNA+AGPPShk2AOR
	X/Tr0XDJytC2gJIr+Pbr0yGbmNE/rxxPPzirTZA8/X/12w8SA1b8rmwNGePwDWd0ZT0/
	KiDg==
Received: by 10.68.129.72 with SMTP id nu8mr3165019pbb.29.1348670123815;
	Wed, 26 Sep 2012 07:35:23 -0700 (PDT)
Received: from yakj.usersys.redhat.com (93-34-169-1.ip50.fastwebnet.it.
	[93.34.169.1])
	by mx.google.com with ESMTPS id my10sm1953156pbc.11.2012.09.26.07.35.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 26 Sep 2012 07:35:20 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 26 Sep 2012 16:34:29 +0200
Message-Id: <1348670069-4862-1-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.7.12
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.160.45
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH] block: live snapshot documentation tweaks
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
X-List-Received-Date: Wed, 26 Sep 2012 14:35:47 -0000

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 qapi-schema.json | 4 ++--
 1 file modificato, 2 inserzioni(+), 2 rimozioni(-)

diff --git a/qapi-schema.json b/qapi-schema.json
index 8719a9d..26ac21f 100644
--- a/qapi-schema.json
+++ b/qapi-schema.json
@@ -1402,7 +1402,7 @@
 # @format: #optional the format of the snapshot image, default is 'qcow2'.
 #
 # @mode: #optional whether and how QEMU should create a new image, default is
-# 'absolute-paths'.
+#        'absolute-paths'.
 ##
 { 'type': 'BlockdevSnapshot',
   'data': { 'device': 'str', 'snapshot-file': 'str', '*format': 'str',
@@ -1456,7 +1456,7 @@
 # @format: #optional the format of the snapshot image, default is 'qcow2'.
 #
 # @mode: #optional whether and how QEMU should create a new image, default is
-# 'absolute-paths'.
+#        'absolute-paths'.
 #
 # Returns: nothing on success
 #          If @device is not a valid block device, DeviceNotFound
-- 
1.7.12


