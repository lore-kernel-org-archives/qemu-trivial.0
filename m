Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SzgK6-0001vG-Qk
	for mharc-qemu-trivial@gnu.org; Thu, 09 Aug 2012 23:55:42 -0400
Received: from eggs.gnu.org ([208.118.235.92]:50124)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1SzgK2-0001ub-TB
	for qemu-trivial@nongnu.org; Thu, 09 Aug 2012 23:55:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1SzgK0-0001oM-SC
	for qemu-trivial@nongnu.org; Thu, 09 Aug 2012 23:55:38 -0400
Received: from mail-pb0-f45.google.com ([209.85.160.45]:55892)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1SzgK0-0001o8-ME
	for qemu-trivial@nongnu.org; Thu, 09 Aug 2012 23:55:36 -0400
Received: by pbbrp12 with SMTP id rp12so1872821pbb.4
	for <qemu-trivial@nongnu.org>; Thu, 09 Aug 2012 20:55:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=uJbypK9SxySyXHVbtM4S3QgKOIPLwyiufusfv/exTok=;
	b=oAWAIG0AKp3KLd3m/+/Ud37cLxIjedjXx/kScLxqKDxKeyQnYCNkFcuwJ4iG8xv+iA
	JduK8yk78WuJznU7WWnGes1SSEikRy1rEC1CsvETwqaxf9Y9+RtOhT4d8OwhfSo3gWno
	TC05CxxeYTu7g2pSc6zzu+BY8YLdUDkSZXnLGIgriO8KMgavK05qExg/HU7AvxmK/Fxp
	e/z1HhNDritFBMQKkc3OVGut+TlO7O9tejZFuZfEbV+rlKhD31KHRwwx1MD4FdCHKdRp
	evoMB2dLTQXOpDIobLaATLoMvUQar3wbBim7jaDU0I7og0VHOFI6CadRLBfV/izXKJRq
	GglQ==
Received: by 10.68.224.161 with SMTP id rd1mr9130255pbc.133.1344570935496;
	Thu, 09 Aug 2012 20:55:35 -0700 (PDT)
Received: from localhost ([124.148.20.9])
	by mx.google.com with ESMTPS id ng8sm2451280pbc.13.2012.08.09.20.55.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 09 Aug 2012 20:55:34 -0700 (PDT)
From: "Peter A. G. Crosthwaite" <peter.crosthwaite@petalogix.com>
To: peter.crosthwaite@petalogix.com, qemu-trivial@nongnu.org, agraf@suse.de,
	qemu-devel@nongnu.org
Date: Fri, 10 Aug 2012 13:54:25 +1000
Message-Id: <1344570866-28595-1-git-send-email-peter.crosthwaite@petalogix.com>
X-Mailer: git-send-email 1.7.0.4
X-Gm-Message-State: ALoCoQlxyz3vo+QhmGt9e5OhB2bQscE+u7KDaLIISMKDLbQeVbQ6F1aLOJwNosmD1XImiLge0NMW
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.160.45
Subject: [Qemu-trivial] [PULL 0/1] device_tree: load_device_tree(): Allow
	NULL sizep
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
X-List-Received-Date: Fri, 10 Aug 2012 03:55:40 -0000

The following changes since commit 3d1d9652978ac5a32a0beb4bdf6065ca39440d89:
  Bruce Rogers (1):
        handle device help before accelerator set up

are available in the git repository at:

  git://developer.petalogix.com/public/qemu.git for-upstream/device-tree-null-size.next

Peter A. G. Crosthwaite (1):
      device_tree: load_device_tree(): Allow NULL sizep

 device_tree.c |    8 ++++++--
 1 files changed, 6 insertions(+), 2 deletions(-)

