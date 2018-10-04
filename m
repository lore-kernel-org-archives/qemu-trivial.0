Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1g86Lg-0005tV-Jv
	for mharc-qemu-trivial@gnu.org; Thu, 04 Oct 2018 12:19:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46473)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosa@redhat.com>) id 1g86Lb-0005ot-BQ
	for qemu-trivial@nongnu.org; Thu, 04 Oct 2018 12:19:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosa@redhat.com>) id 1g86LT-0002cr-Lj
	for qemu-trivial@nongnu.org; Thu, 04 Oct 2018 12:19:29 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44474)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <crosa@redhat.com>)
	id 1g86L8-0002Qr-P7; Thu, 04 Oct 2018 12:19:03 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1BB2B3082B24;
	Thu,  4 Oct 2018 16:19:01 +0000 (UTC)
Received: from dhcp-17-10.bos.redhat.com (dhcp-17-10.bos.redhat.com
	[10.18.17.10])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0E66F77C02;
	Thu,  4 Oct 2018 16:18:59 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: qemu-devel@nongnu.org
Cc: Riku Voipio <riku.voipio@iki.fi>, Eduardo Habkost <ehabkost@redhat.com>,
	qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
	Cleber Rosa <crosa@redhat.com>, qemu-trivial@nongnu.org,
	Max Reitz <mreitz@redhat.com>
Date: Thu,  4 Oct 2018 12:18:47 -0400
Message-Id: <20181004161852.11673-6-crosa@redhat.com>
In-Reply-To: <20181004161852.11673-1-crosa@redhat.com>
References: <20181004161852.11673-1-crosa@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.45]);
	Thu, 04 Oct 2018 16:19:01 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH 05/10] docs/devel/testing.rst: add missing
 newlines after code block
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 04 Oct 2018 16:19:32 -0000

The line immediate following a ".. code::" block is considered
to contains arguments to the "code directive".  The lack of a
new line gives me during at parse time:

   testing.rst:63: (ERROR/3) Error in "code" directive:
   maximum 1 argument(s) allowed, 3 supplied.

   .. code::
     make check-unit V=1

   testing.rst:120: (ERROR/3) Error in "code" directive:
   maximum 1 argument(s) allowed, 3 supplied.

   .. code::
     make check-qtest V=1

Let's add the missing newlines, both for consistency and to
avoid the parsing errors.

Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 docs/devel/testing.rst | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
index 727c4019b5..9355ad49f2 100644
--- a/docs/devel/testing.rst
+++ b/docs/devel/testing.rst
@@ -61,6 +61,7 @@ variable (which affects memory reclamation and catches invalid pointers better)
 and gtester options. If necessary, you can run
 
 .. code::
+
   make check-unit V=1
 
 and copy the actual command line which executes the unit test, then run
@@ -118,6 +119,7 @@ and using gdb on the test is still simple to do: find out the actual command
 from the output of
 
 .. code::
+
   make check-qtest V=1
 
 which you can run manually.
-- 
2.17.1


