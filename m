Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WaDD2-0002CB-1r
	for mharc-qemu-trivial@gnu.org; Tue, 15 Apr 2014 19:56:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45081)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1WaDCo-0001VU-2t
	for qemu-trivial@nongnu.org; Tue, 15 Apr 2014 19:56:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1WaDCf-0005Zq-30
	for qemu-trivial@nongnu.org; Tue, 15 Apr 2014 19:55:58 -0400
Received: from mail-pb0-x236.google.com ([2607:f8b0:400e:c01::236]:54699)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>)
	id 1WaDCM-0005X2-6o; Tue, 15 Apr 2014 19:55:30 -0400
Received: by mail-pb0-f54.google.com with SMTP id ma3so10175446pbc.13
	for <multiple recipients>; Tue, 15 Apr 2014 16:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:content-type:content-transfer-encoding;
	bh=MfK2KQ+AB7qcc+jkVTVyAzmLOPnj1fwYoG5nOpY2cEE=;
	b=uqedy0JyTtq7hl46v5nVDYMhBCRNwNY8caxb0Zfie2gkNis3o9JvlcO9M4RhwDlTCl
	Dx3+rNsG1L9K/a0DD+U4xte/nBgZIW/uS8k4hEy9hy+Xzn5OyRwBnyiy9e0yGuJjDLxt
	a35sKO7LzUfbvN2yAM/AWIFSXrIAkT0mr5ohCKKh7c/AHyFp5DKfoThUCnnY8sFHjDyL
	D8tcApdxgvsEzyCJQvmkzsde5hfNGPkMA5DG1AYKAqT9/mjYs67fm9b1Mo/YKdjH8pn6
	WPEvPhykwPyLMoASyBU9Ab7nvYa0dksiA+3fvMUCadN7nvEQxf+Y/SUYfHdoUttt4R3L
	J3mQ==
X-Received: by 10.66.254.234 with SMTP id al10mr4898615pad.137.1397606128884; 
	Tue, 15 Apr 2014 16:55:28 -0700 (PDT)
Received: from [192.168.1.104] ([124.126.238.172])
	by mx.google.com with ESMTPSA id
	my6sm42856141pbc.36.2014.04.15.16.55.24 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 15 Apr 2014 16:55:28 -0700 (PDT)
Message-ID: <534DC6EA.6050203@gmail.com>
Date: Wed, 16 Apr 2014 07:55:22 +0800
From: Chen Gang <gang.chen.5i5j@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Markus Armbruster <armbru@redhat.com>, 
	Peter Maydell <peter.maydell@linaro.org>,
	Michael Tokarev <mjt@tls.msk.ru>, Anthony Liguori <aliguori@amazon.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c01::236
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: [Qemu-trivial] [PATCH trivial v2 0/2] vl: simplify code for main()
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
X-List-Received-Date: Tue, 15 Apr 2014 23:56:07 -0000

In "vl.c", at least, we can simplify the code below, so can let readers
read professional C code (especially for new readers, which often start
reading code at main function).

 - Remove useless 'continue' in main().

 - Eliminate a superfluous local variable in main().

Signed-off-by: Chen Gang <gang.chen.5i5j@gmail.com>
---
 vl.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)


