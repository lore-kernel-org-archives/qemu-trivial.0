Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WN3qS-0003Rf-TK
	for mharc-qemu-trivial@gnu.org; Mon, 10 Mar 2014 13:18:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57256)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gsomlo@gmail.com>) id 1WN3qL-0003Fx-5Q
	for qemu-trivial@nongnu.org; Mon, 10 Mar 2014 13:18:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gsomlo@gmail.com>) id 1WN3qF-00089q-Kq
	for qemu-trivial@nongnu.org; Mon, 10 Mar 2014 13:18:25 -0400
Received: from mail-qc0-x22a.google.com ([2607:f8b0:400d:c01::22a]:37332)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gsomlo@gmail.com>)
	id 1WN3q1-000864-9L; Mon, 10 Mar 2014 13:18:05 -0400
Received: by mail-qc0-f170.google.com with SMTP id e9so8211938qcy.29
	for <multiple recipients>; Mon, 10 Mar 2014 10:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=vanW1ER77vNaflHGMV+7o0l4K0J5djxP2U7QJH8qJl0=;
	b=YFiv1BOvav3boEuepcSnqGm/yT/LR7uwFa8KCw+Z4YGqUtDZQ5UjdrhNEqJHy/I3S1
	hU/bK9zOxB8Pb7P/y4gLBDr6VJfWvdYnZHv6Mc3oFFyWtSbrRkLgCANoGuURO0WScloM
	MtUznd3HJlyoYHtj4uGw0OFf7Z9/zZ+2vAZ6/+36K2Aztu3/9F4c2FifgDSvmEubfnVn
	l04vSe91D7Jefcxa4ITPHu3cbjFaFDfCk80XQuzUnAp8vEK4Bm9Cpb1WbmRVtWGV4NbN
	+oL2T3cuOnlTBTmuHiwy+9eQKWpRaAmt0eOFlOBnru9qkl5oj2hnBEHgSJBfaRs7K6zw
	Tupg==
X-Received: by 10.224.60.71 with SMTP id o7mr42029243qah.38.1394471884799;
	Mon, 10 Mar 2014 10:18:04 -0700 (PDT)
Received: from ERROL.INI.CMU.EDU (ERROL.INI.CMU.EDU. [128.2.16.43])
	by mx.google.com with ESMTPSA id
	r110sm26720150qgd.1.2014.03.10.10.18.04 for <multiple recipients>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 10 Mar 2014 10:18:04 -0700 (PDT)
Date: Mon, 10 Mar 2014 13:14:57 -0400
From: "Gabriel L. Somlo" <gsomlo@gmail.com>
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Message-ID: <20140310171456.GS17184@ERROL.INI.CMU.EDU>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400d:c01::22a
Subject: [Qemu-trivial] [PATCH] Add qga/qapi-generated to .gitignore
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
X-List-Received-Date: Mon, 10 Mar 2014 17:18:31 -0000

The folder "qga/qapi-generated" shows up after building QEMU, and
gets in the way during e.g. "git add ."; Add it to .gitignore to
keep it from accidentally ending up in the wrong place.

Signed-off-by: Gabriel Somlo <somlo@cmu.edu>
---
 .gitignore | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.gitignore b/.gitignore
index ef7019f..a0895c9 100644
--- a/.gitignore
+++ b/.gitignore
@@ -21,6 +21,7 @@
 libdis*
 libuser
 /linux-headers/asm
+qga/qapi-generated
 /qapi-generated
 /qapi-types.[ch]
 /qapi-visit.[ch]
-- 
1.8.1.4


