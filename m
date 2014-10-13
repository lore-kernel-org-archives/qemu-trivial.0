Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Xdgdt-0000gj-2c
	for mharc-qemu-trivial@gnu.org; Mon, 13 Oct 2014 10:30:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51825)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1Xdgdh-0000fn-Ro
	for qemu-trivial@nongnu.org; Mon, 13 Oct 2014 10:30:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1XdgdY-0000mm-RB
	for qemu-trivial@nongnu.org; Mon, 13 Oct 2014 10:30:21 -0400
Received: from mail-pd0-x22a.google.com ([2607:f8b0:400e:c02::22a]:50991)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>)
	id 1XdgdY-0000mR-K7; Mon, 13 Oct 2014 10:30:12 -0400
Received: by mail-pd0-f170.google.com with SMTP id p10so5773968pdj.29
	for <multiple recipients>; Mon, 13 Oct 2014 07:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:content-type:content-transfer-encoding;
	bh=ZKb6NS/f3f2ZX5lW4rKieVEFjFU8T8nYm9U5gHcyXK0=;
	b=G7j2sk8tlOfdmOZMQUhtXD7POmYh7hPqXQsZpbwni5KWg/svvVcjz+7c7iJgi+j3Dg
	Lbyt9GmRdrB8dAvnD/rDyQ5PVz5OWdcQvnWOOk00AewPY9LN41WUc8cYIh4clIkVx5mY
	tErw4LeS+APKDYGNSvGyBL1wQc116zHJOmecO9Znwzc5euflBhI74ZaUdsQGOm+gOA3g
	z2ZYKa2W6/1CNY/PVa/8smDTPRPMiR7rxGvPuIEu5Wnza7tPTB9h/N/Qym2giXweO+aa
	kZ4oAUeGnIoOS/1XIT/hT91MWz7K9zvNbeDGMJvkgxoC9m6T19B0w87tWMO4/MNmHuCt
	v6aA==
X-Received: by 10.68.163.164 with SMTP id yj4mr2408327pbb.142.1413210610527;
	Mon, 13 Oct 2014 07:30:10 -0700 (PDT)
Received: from ShengShiZhuChengdeMacBook-Pro.local ([223.72.65.118])
	by mx.google.com with ESMTPSA id ot8sm11442840pbc.1.2014.10.13.07.30.07
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 Oct 2014 07:30:09 -0700 (PDT)
Message-ID: <543BE352.3080609@gmail.com>
Date: Mon, 13 Oct 2014 22:36:02 +0800
From: Chen Gang <gang.chen.5i5j@gmail.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.2
MIME-Version: 1.0
To: agraf@suse.de, pbonzini@redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c02::22a
Cc: qemu-trivial@nongnu.org, qemu-ppc@nongnu.org,
	qemu-devel <qemu-devel@nongnu.org>, kvm@vger.kernel.org
Subject: [Qemu-trivial] [PATCH] target-ppc: kvm: Fix memory overflow issue
	about strncat()
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
X-List-Received-Date: Mon, 13 Oct 2014 14:30:31 -0000

strncat() will append additional '\0' to destination buffer, so need
additional 1 byte for it, or may cause memory overflow, just like other
area within QEMU have done.

Signed-off-by: Chen Gang <gang.chen.5i5j@gmail.com>
---
 target-ppc/kvm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target-ppc/kvm.c b/target-ppc/kvm.c
index 9c23c6b..66e7ce5 100644
--- a/target-ppc/kvm.c
+++ b/target-ppc/kvm.c
@@ -1794,8 +1794,8 @@ static uint64_t kvmppc_read_int_cpu_dt(const char *propname)
         return -1;
     }
 
-    strncat(buf, "/", sizeof(buf) - strlen(buf));
-    strncat(buf, propname, sizeof(buf) - strlen(buf));
+    strncat(buf, "/", sizeof(buf) - strlen(buf) - 1);
+    strncat(buf, propname, sizeof(buf) - strlen(buf) - 1);
 
     f = fopen(buf, "rb");
     if (!f) {
-- 
1.9.3

