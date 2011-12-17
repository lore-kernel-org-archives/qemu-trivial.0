Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RbsgC-0003bC-Oz
	for mharc-qemu-trivial@gnu.org; Sat, 17 Dec 2011 06:43:52 -0500
Received: from eggs.gnu.org ([140.186.70.92]:38440)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1RbsgA-0003Rr-AO
	for qemu-trivial@nongnu.org; Sat, 17 Dec 2011 06:43:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Rbsg9-0006IN-KL
	for qemu-trivial@nongnu.org; Sat, 17 Dec 2011 06:43:50 -0500
Received: from mail-qy0-f173.google.com ([209.85.216.173]:45492)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>)
	id 1Rbsg7-0006I4-Hc; Sat, 17 Dec 2011 06:43:47 -0500
Received: by qcsd15 with SMTP id d15so2476192qcs.4
	for <multiple recipients>; Sat, 17 Dec 2011 03:43:46 -0800 (PST)
MIME-Version: 1.0
Received: by 10.229.76.215 with SMTP id d23mr2961101qck.45.1324122226652; Sat,
	17 Dec 2011 03:43:46 -0800 (PST)
Received: by 10.229.211.4 with HTTP; Sat, 17 Dec 2011 03:43:46 -0800 (PST)
In-Reply-To: <1324110459-3932-1-git-send-email-sw@weilnetz.de>
References: <1324110459-3932-1-git-send-email-sw@weilnetz.de>
Date: Sat, 17 Dec 2011 11:43:46 +0000
Message-ID: <CAFEAcA_1yB-iwDtcQ6FKJ3-6S0aqhUHijqGybzdfuYG_hKAFZA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
To: Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.216.173
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 00/11] configure: Fix
	compiler warnings in config.log
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
X-List-Received-Date: Sat, 17 Dec 2011 11:43:51 -0000

On 17 December 2011 08:27, Stefan Weil <sw@weilnetz.de> wrote:
> Recently some patches were sent from Peter Maydell to improve
> the output in config.log.
>
> This new patch series also improves that output by eliminating
> some compiler warnings.

All except 03/11:
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

-- PMM

