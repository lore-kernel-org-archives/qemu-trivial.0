Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TqQyS-0005pZ-CD
	for mharc-qemu-trivial@gnu.org; Wed, 02 Jan 2013 11:15:24 -0500
Received: from eggs.gnu.org ([208.118.235.92]:52985)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1TqQyO-0005o2-La
	for qemu-trivial@nongnu.org; Wed, 02 Jan 2013 11:15:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1TqQyM-0005oE-4l
	for qemu-trivial@nongnu.org; Wed, 02 Jan 2013 11:15:20 -0500
Received: from qmta10.emeryville.ca.mail.comcast.net ([76.96.30.17]:48139)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1TqQyL-0005o3-QI
	for qemu-trivial@nongnu.org; Wed, 02 Jan 2013 11:15:18 -0500
Received: from omta05.emeryville.ca.mail.comcast.net ([76.96.30.43])
	by qmta10.emeryville.ca.mail.comcast.net with comcast
	id j42e1k0030vp7WLAA4FGfD; Wed, 02 Jan 2013 16:15:16 +0000
Received: from office.redhat.com ([24.10.251.25])
	by omta05.emeryville.ca.mail.comcast.net with comcast
	id j4FC1k0040ZdyUg8R4FEE5; Wed, 02 Jan 2013 16:15:16 +0000
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed,  2 Jan 2013 09:15:11 -0700
Message-Id: <1357143311-10927-1-git-send-email-eblake@redhat.com>
X-Mailer: git-send-email 1.8.0.2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=comcast.net;
	s=q20121106; t=1357143316;
	bh=rpQo2FBW6EAD29myi8meo/YFITWMX8VpszR56m/4KmQ=;
	h=Received:Received:From:To:Subject:Date:Message-Id;
	b=IF1MC8wWM/RH5Nh2hn5HpxfMR9EnAhZi5uH7KEuvKKcHeEVAPNvL+5MREXEvRJRkY
	+CyVYadMxZmRTeJ5tJ9v1JX60ZhNDAM/muzP7v4ytYw9z0DnP5zjO1EIlLCts67osx
	axeSRwgE9ALjs9I8ZM0p7rjOKJ39j686USKaRRFRz5InN0Sf/6doyYUGTcI/hy4EIC
	Jt1p97HyCi8B17egV6+N3y90KATw4bknI9VDPBRmLpEkc8O+iPS2QTTVL1VQYFowXB
	VeQ9aCyAA1BXGs+Ja+6gfwAQPrTdg5tONx5dgb0o9JJ526Bg3cRLXsS2UxOqxpwrhR
	eNEwWV34ywrOg==
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 76.96.30.17
Cc: qemu-trivial@nongnu.org, lcapitulino@redhat.com
Subject: [Qemu-trivial] [PATCH] qga: add missing commas in json docs
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
X-List-Received-Date: Wed, 02 Jan 2013 16:15:23 -0000

* qga/qapi-schema.json: Use valid JSON.

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 qga/qapi-schema.json | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/qga/qapi-schema.json b/qga/qapi-schema.json
index ed0eb69..d91d903 100644
--- a/qga/qapi-schema.json
+++ b/qga/qapi-schema.json
@@ -31,7 +31,7 @@
 #
 # Since: 1.1
 # ##
-{ 'command': 'guest-sync-delimited'
+{ 'command': 'guest-sync-delimited',
   'data':    { 'id': 'int' },
   'returns': 'int' }

@@ -69,7 +69,7 @@
 #
 # Since: 0.15.0
 ##
-{ 'command': 'guest-sync'
+{ 'command': 'guest-sync',
   'data':    { 'id': 'int' },
   'returns': 'int' }

-- 
1.8.0.2


