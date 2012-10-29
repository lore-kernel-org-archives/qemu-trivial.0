Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TSmCT-00046O-4Z
	for mharc-qemu-trivial@gnu.org; Mon, 29 Oct 2012 06:04:05 -0400
Received: from eggs.gnu.org ([208.118.235.92]:60226)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TSmCN-0003qn-CJ
	for qemu-trivial@nongnu.org; Mon, 29 Oct 2012 06:04:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TSmCI-0000jc-AB
	for qemu-trivial@nongnu.org; Mon, 29 Oct 2012 06:03:59 -0400
Received: from mail-lb0-f173.google.com ([209.85.217.173]:56725)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1TSmCE-0000dU-Sq; Mon, 29 Oct 2012 06:03:51 -0400
Received: by mail-lb0-f173.google.com with SMTP id gj3so2851494lbb.4
	for <multiple recipients>; Mon, 29 Oct 2012 03:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=3dS14bLPH5pBAzvpGwApmGURBxhH1JOjzlD1e45SW9g=;
	b=JETY0nmA6CmE2G2HSS0mrxkXoCw5bTD1sr0tOplEK081wymjc/7HgV8mcl7uog3WBU
	UlDkEh0NytQx/qW4hmHjVldqgNXVpW3M2qqyi1/xHSgRmnZj5WkqBWg8czbJVO0r7CZH
	5iHqeEKa/LNyuMdtqiyHBB9rHTGJp9O9UBn1xIRy+Ubrd5pmMRbKmDQxRvay8BgH4ryH
	aqRMdCM42PnN2mDYHtO4cLjvN7KhauaE20yo5tZ+t4+FkNx70YQ8JNs705YrNoCDX3q4
	Hw4EWnGZyPUhp0LUSD9tBlOn+gfnESU5EdfZ9cSSaddJGRbByT10c+ZEBktc1e3m8F5N
	9gTw==
MIME-Version: 1.0
Received: by 10.112.48.74 with SMTP id j10mr11738230lbn.94.1351505029574; Mon,
	29 Oct 2012 03:03:49 -0700 (PDT)
Received: by 10.112.23.37 with HTTP; Mon, 29 Oct 2012 03:03:49 -0700 (PDT)
In-Reply-To: <CAFEAcA9WH_jrHGns6dEKa4F9TaQXR8FEWJ27rmNY+0yQ+MJepQ@mail.gmail.com>
References: <1330121921-23462-1-git-send-email-meadori@codesourcery.com>
	<4F4814F7.6040008@suse.de> <4F71D7AD.8080103@codesourcery.com>
	<CAFEAcA8R+J+DeN7V_6bVHhh3kYprA8EKWJXEzfDp7iWjWzYLqQ@mail.gmail.com>
	<CAFEAcA9WH_jrHGns6dEKa4F9TaQXR8FEWJ27rmNY+0yQ+MJepQ@mail.gmail.com>
Date: Mon, 29 Oct 2012 11:03:49 +0100
Message-ID: <CAJSP0QXAtsWdeoROrZ-zN5YWr2wpkZCJcjQH7sQmLG8vQTD9Ag@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=ISO-8859-1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.217.173
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	Meador Inge <meadori@codesourcery.com>, Paul Brook <paul@codesourcery.com>,
	=?ISO-8859-1?Q?Andreas_F=E4rber?= <afaerber@suse.de>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v1 1/1] m68k: Return
 semihosting errno values correctly
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
X-List-Received-Date: Mon, 29 Oct 2012 10:04:03 -0000

On Mon, Oct 29, 2012 at 10:42 AM, Peter Maydell
<peter.maydell@linaro.org> wrote:
> I just noticed this patch never got applied by anybody
> (and alas it now needs a refresh because the file was renamed
> in the interim.)

Merged, thanks!

https://github.com/stefanha/qemu/commits/trivial-patches

Please CC qemu-trivial when suggesting a patch goes through the trivial queue.

Stefan

