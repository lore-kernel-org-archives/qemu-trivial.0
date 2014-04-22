Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WcPGy-0003KF-DI
	for mharc-qemu-trivial@gnu.org; Mon, 21 Apr 2014 21:13:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59531)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1WcPGo-00037P-0s
	for qemu-trivial@nongnu.org; Mon, 21 Apr 2014 21:13:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1WcPGf-0004yI-01
	for qemu-trivial@nongnu.org; Mon, 21 Apr 2014 21:13:09 -0400
Received: from mail-pb0-x22a.google.com ([2607:f8b0:400e:c01::22a]:58884)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>)
	id 1WcPGM-0004uh-Hv; Mon, 21 Apr 2014 21:12:42 -0400
Received: by mail-pb0-f42.google.com with SMTP id un15so346051pbc.29
	for <multiple recipients>; Mon, 21 Apr 2014 18:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:content-type:content-transfer-encoding;
	bh=I6BCZQ0hotee458tW5kg3Pw1mYEbF9OiHb64/PIZbeE=;
	b=nakN7+5PQ1TqD3GfBs/0XKit9rq/IS8V2a5FxfjEekO/KuvV85v3FTduKJgB6HQLYb
	C+TUyxGBUCQ1MU29akrBjWOzwXTrwjALEg+wxNd44ksEEQ3asStm7BywTs0iXd6NJF53
	mvlMElBwQP0Vy5gPG2zGa6VGtW1MdOTf2mm6Epwcd0Ef2AJHlp6Ju6i1c1zBcJiBbz0G
	D4QyolXFdxexlNRqsE6nGnBfHGVxydiBfpDjXicra9XG4zsL307nB035AJB+feFfxSAr
	ogq57RrA0/CTrqZDCLgmop9Onwnn9k5bK2Rxv3O9qy7oCKQMM/k4kCk3XfgxvLyJocnR
	YIqQ==
X-Received: by 10.68.113.5 with SMTP id iu5mr41129887pbb.60.1398129161020;
	Mon, 21 Apr 2014 18:12:41 -0700 (PDT)
Received: from [192.168.1.104] ([124.126.236.72])
	by mx.google.com with ESMTPSA id
	oa3sm80890273pbb.15.2014.04.21.18.12.37 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 21 Apr 2014 18:12:40 -0700 (PDT)
Message-ID: <5355C202.9040603@gmail.com>
Date: Tue, 22 Apr 2014 09:12:34 +0800
From: Chen Gang <gang.chen.5i5j@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>, 
	Peter Maydell <peter.maydell@linaro.org>,
	Michael Tokarev <mjt@tls.msk.ru>, Anthony Liguori <aliguori@amazon.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c01::22a
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: [Qemu-trivial] [PATCH trivial v2] vl: avoid closing stdout with
	'writeconfig'
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
X-List-Received-Date: Tue, 22 Apr 2014 01:13:19 -0000

'writeconfig' supports output to stdout (with '-'); when that happens,
we must not close stdout, or further command line options that also use
stdout will be impacted. (Although 'writeconfig' was copied from
'readconfig', the latter does not have the problem because it does not
support reading from '-')

Signed-off-by: Chen Gang <gang.chen.5i5j@gmail.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 vl.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/vl.c b/vl.c
index 9975e5a..215467f 100644
--- a/vl.c
+++ b/vl.c
@@ -3855,7 +3855,9 @@ int main(int argc, char **argv, char **envp)
                         }
                     }
                     qemu_config_write(fp);
-                    fclose(fp);
+                    if (fp != stdout) {
+                        fclose(fp);
+                    }
                     break;
                 }
             case QEMU_OPTION_qtest:
-- 
1.7.11.7



