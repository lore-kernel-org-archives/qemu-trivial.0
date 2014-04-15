Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WaDEB-0004Tc-JB
	for mharc-qemu-trivial@gnu.org; Tue, 15 Apr 2014 19:57:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45346)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1WaDE1-0004Gr-3B
	for qemu-trivial@nongnu.org; Tue, 15 Apr 2014 19:57:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1WaDDr-0006Op-Pq
	for qemu-trivial@nongnu.org; Tue, 15 Apr 2014 19:57:12 -0400
Received: from mail-pa0-x22b.google.com ([2607:f8b0:400e:c03::22b]:35634)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>)
	id 1WaDDM-00061n-6M; Tue, 15 Apr 2014 19:56:43 -0400
Received: by mail-pa0-f43.google.com with SMTP id bj1so10188765pad.16
	for <multiple recipients>; Tue, 15 Apr 2014 16:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=HftVmgvSYaNglZRWl5Zw2Ezf5cBv8ubWnhtV4Kij0bw=;
	b=afx3E/Rn8HkmGgWj8uD6oiIIn8KnVqW2z77NnO2P1un6vWjspKaZqYzsElil9qCGKN
	TFYzTinKTd4qZJgwGCyFa2vwsbavGHjcPAIKbLO+zL440TV6FJCkLL3RybNdXCqBtPj0
	0f0W5ORQW68MwgDaWwBstcW2Si9bbUGecw0ViQBh/9yaOBTVXpSWapXroRvjWgFkUuZw
	i+f4NMslGKAR2Rsh+GG5DBLiCkcQKY29AobLKwb9IXmVVZcKkNvQx0SNRqzJCwbx1Hk+
	2/AqLngvcISpazbtAU5OmY0tI7Ol3S3YQior6RGP5y39ZdFeqMQyhxlDouNC8J+BKCeg
	EZhQ==
X-Received: by 10.66.219.6 with SMTP id pk6mr5046468pac.9.1397606191116;
	Tue, 15 Apr 2014 16:56:31 -0700 (PDT)
Received: from [192.168.1.104] ([124.126.238.172])
	by mx.google.com with ESMTPSA id
	tk5sm42830587pbc.63.2014.04.15.16.56.22 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 15 Apr 2014 16:56:27 -0700 (PDT)
Message-ID: <534DC724.4040301@gmail.com>
Date: Wed, 16 Apr 2014 07:56:20 +0800
From: Chen Gang <gang.chen.5i5j@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Markus Armbruster <armbru@redhat.com>, 
	Peter Maydell <peter.maydell@linaro.org>,
	Michael Tokarev <mjt@tls.msk.ru>, Anthony Liguori <aliguori@amazon.com>
References: <534DC6EA.6050203@gmail.com>
In-Reply-To: <534DC6EA.6050203@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c03::22b
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: [Qemu-trivial] [PATCH trivial v2 1/2] vl: Remove useless 'continue'
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
X-List-Received-Date: Tue, 15 Apr 2014 23:57:22 -0000

"This if else has no code between it and the end of the enclosing
while loop. This makes this continue redundant."

Signed-off-by: Chen Gang <gang.chen.5i5j@gmail.com>
---
 vl.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/vl.c b/vl.c
index 9975e5a..7505002 100644
--- a/vl.c
+++ b/vl.c
@@ -3034,7 +3034,6 @@ int main(int argc, char **argv, char **envp)
         if (argv[optind][0] != '-') {
             /* disk image */
             optind++;
-            continue;
         } else {
             const QEMUOption *popt;
 
-- 
1.7.9.5



