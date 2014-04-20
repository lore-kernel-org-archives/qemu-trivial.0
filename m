Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WbqVP-0005Cb-Dx
	for mharc-qemu-trivial@gnu.org; Sun, 20 Apr 2014 08:05:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39715)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1WbqVE-0004fA-FF
	for qemu-trivial@nongnu.org; Sun, 20 Apr 2014 08:05:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1WbqV5-0004mq-Dg
	for qemu-trivial@nongnu.org; Sun, 20 Apr 2014 08:05:44 -0400
Received: from mail-pd0-x22e.google.com ([2607:f8b0:400e:c02::22e]:42805)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>)
	id 1WbqUj-0004k4-2x; Sun, 20 Apr 2014 08:05:13 -0400
Received: by mail-pd0-f174.google.com with SMTP id y13so2802778pdi.19
	for <multiple recipients>; Sun, 20 Apr 2014 05:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:content-type:content-transfer-encoding;
	bh=m//Tzdk28H67C1aOoe27vmmOA29aNi1ugT6sV34ahBM=;
	b=0yrBxwf1si0qWqLI1qgYhbZRVkmc94x4OXWoXZ36gwmkKN/JnAtkFZM/+bx0c3fV2N
	WftL7FoFz2aFk8zPpxHNGT+zdAAy89VUphanmwAjQcoKJB+63/Gm1XDoraWkq+A3Pgp4
	/r7ZTU0xFq2CFjzHGJOYA4y2cBfQyCdxiAC8DiNBetBVPKP04WY4ifkxm7uN5rbqDXXA
	div854P1R1p6X5ESrcOi5PFzTw2zfSs5zMe2Kk5akVZ/BwMM5ps7MbvJB4zXEAAkmk+z
	Vjdwwa1RGnnrIW7eKwcpnVfNebDKeR9GZHZRNC1odNy39lpag0xAfA42C4IO20TuDSdE
	6fYg==
X-Received: by 10.68.201.165 with SMTP id kb5mr32165493pbc.80.1397995511108;
	Sun, 20 Apr 2014 05:05:11 -0700 (PDT)
Received: from [192.168.1.101] ([223.72.65.54])
	by mx.google.com with ESMTPSA id bc4sm71496318pbb.2.2014.04.20.05.05.08
	for <multiple recipients>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Sun, 20 Apr 2014 05:05:10 -0700 (PDT)
Message-ID: <5353B7F9.4060803@gmail.com>
Date: Sun, 20 Apr 2014 20:05:13 +0800
From: Chen Gang <gang.chen.5i5j@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130625 Thunderbird/17.0.7
MIME-Version: 1.0
To: Markus Armbruster <armbru@redhat.com>, 
	Peter Maydell <peter.maydell@linaro.org>,
	mjt@tls.msk.ru, aliguori@amazon.com
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c02::22e
Cc: qemu-trivial@nongnu.org, QEMU Developers <qemu-devel@nongnu.org>
Subject: [Qemu-trivial] [PATCH trivial] vl: Avoid to close stdout after
 finish 'writeconfig' option
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
X-List-Received-Date: Sun, 20 Apr 2014 12:05:53 -0000

After finish 'writeconfig' to stdout (with '-'), we want to copy/past
the related information mannually, not for redirection ('readconfig'
does not support '-').

So we can not close the stdout, or next options which may use stdout
will not be displayed.


Signed-off-by: Chen Gang <gang.chen.5i5j@gmail.com>
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

