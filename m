Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QQKvE-0001F6-H8
	for mharc-qemu-trivial@gnu.org; Sat, 28 May 2011 10:55:24 -0400
Received: from eggs.gnu.org ([140.186.70.92]:39563)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andreas.faerber@web.de>) id 1QQKvC-0001Bb-Aq
	for qemu-trivial@nongnu.org; Sat, 28 May 2011 10:55:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andreas.faerber@web.de>) id 1QQKvB-00042P-E8
	for qemu-trivial@nongnu.org; Sat, 28 May 2011 10:55:22 -0400
Received: from fmmailgate01.web.de ([217.72.192.221]:59739)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andreas.faerber@web.de>)
	id 1QQKv9-000427-Hk; Sat, 28 May 2011 10:55:19 -0400
Received: from smtp03.web.de  ( [172.20.0.65])
	by fmmailgate01.web.de (Postfix) with ESMTP id 91CA718F946C7;
	Sat, 28 May 2011 16:55:17 +0200 (CEST)
Received: from [87.173.108.219] (helo=[10.0.1.1])
	by smtp03.web.de with asmtp (TLSv1:AES128-SHA:128) (WEB.DE 4.110 #2)
	id 1QQKv7-00036k-00; Sat, 28 May 2011 16:55:17 +0200
Message-Id: <77A77737-0259-40D1-B662-E6009057999B@web.de>
From: =?ISO-8859-1?Q?Andreas_F=E4rber?= <andreas.faerber@web.de>
To: Alexandre Raymond <cerbere@gmail.com>
In-Reply-To: <1306516951-31105-1-git-send-email-cerbere@gmail.com>
Content-Type: text/plain; charset=US-ASCII; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0 (Apple Message framework v936)
Date: Sat, 28 May 2011 16:55:16 +0200
References: <1306516951-31105-1-git-send-email-cerbere@gmail.com>
X-Mailer: Apple Mail (2.936)
Sender: andreas.faerber@web.de
X-Sender: Andreas.Faerber@web.de
X-Provags-ID: V01U2FsdGVkX18zb8x8US0uYnyYKmgy5RuRv4bXpLb4BUW8segK
	MH3JvNbGFXE73LlHV/0fh1jEFgvaeX57lzmK+5471uom+Pqmld
	lmTU+txFzaZqOITGdOQQ==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4-2.6
X-Received-From: 217.72.192.221
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 0/6] Fix compilation issues
	under darwin
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
X-List-Received-Date: Sat, 28 May 2011 14:55:23 -0000

Hello,

Am 27.05.2011 um 19:22 schrieb Alexandre Raymond:

> The following series contains trivial patches to fix several minor  
> issues
> encountered while compiling qemu under OSX 10.6.7.
>
> I used [./configure --disable-bsd-user --disable-darwin-user -- 
> enable-io-thread]
> to configure the build.

In the future, please cc me for Darwin. I'll review them tomorrow.

Thanks,
Andreas

