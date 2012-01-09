Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RkJ7N-0004I2-C9
	for mharc-qemu-trivial@gnu.org; Mon, 09 Jan 2012 12:34:45 -0500
Received: from eggs.gnu.org ([140.186.70.92]:57661)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1RkJ7E-0003sj-UZ
	for qemu-trivial@nongnu.org; Mon, 09 Jan 2012 12:34:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1RkJ7B-0001tZ-7B
	for qemu-trivial@nongnu.org; Mon, 09 Jan 2012 12:34:36 -0500
Received: from mail-qw0-f52.google.com ([209.85.216.52]:49364)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>)
	id 1RkJ71-0001sJ-It; Mon, 09 Jan 2012 12:34:23 -0500
Received: by qadc11 with SMTP id c11so2330717qad.4
	for <multiple recipients>; Mon, 09 Jan 2012 09:34:22 -0800 (PST)
MIME-Version: 1.0
Received: by 10.224.106.196 with SMTP id y4mr12434282qao.90.1326130462642;
	Mon, 09 Jan 2012 09:34:22 -0800 (PST)
Received: by 10.229.39.134 with HTTP; Mon, 9 Jan 2012 09:34:22 -0800 (PST)
In-Reply-To: <1326130191-20344-1-git-send-email-sw@weilnetz.de>
References: <1326130191-20344-1-git-send-email-sw@weilnetz.de>
Date: Mon, 9 Jan 2012 17:34:22 +0000
Message-ID: <CAFEAcA_-2pOYqeAAuu7Unx+-Df52KgzxE7VPAQK-U+YJmQnEHw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
To: Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.216.52
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Add 'fall through' comments
 to case statements without break
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
X-List-Received-Date: Mon, 09 Jan 2012 17:34:43 -0000

On 9 January 2012 17:29, Stefan Weil <sw@weilnetz.de> wrote:
> These comments are used by static code analysis tools and in code reviews
> to avoid false warnings because of missing break statements.
>
> The case statements handled here were reported by coverity.
>
> Signed-off-by: Stefan Weil <sw@weilnetz.de>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

