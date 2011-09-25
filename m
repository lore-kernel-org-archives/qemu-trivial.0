Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1R7vkv-00012M-4M
	for mharc-qemu-trivial@gnu.org; Sun, 25 Sep 2011 16:56:57 -0400
Received: from eggs.gnu.org ([140.186.70.92]:42291)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1R7vks-0000sp-R5
	for qemu-trivial@nongnu.org; Sun, 25 Sep 2011 16:56:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1R7vkr-0005Pd-VF
	for qemu-trivial@nongnu.org; Sun, 25 Sep 2011 16:56:54 -0400
Received: from mail-gx0-f173.google.com ([209.85.161.173]:53864)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>)
	id 1R7vkp-0005PO-9f; Sun, 25 Sep 2011 16:56:51 -0400
Received: by gxk25 with SMTP id 25so4811645gxk.4
	for <multiple recipients>; Sun, 25 Sep 2011 13:56:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.27.102 with SMTP id s6mr24879234pbg.43.1316984209763; Sun,
	25 Sep 2011 13:56:49 -0700 (PDT)
Received: by 10.143.82.20 with HTTP; Sun, 25 Sep 2011 13:56:49 -0700 (PDT)
In-Reply-To: <1316980937-18588-1-git-send-email-antonynpavlov@gmail.com>
References: <1316980937-18588-1-git-send-email-antonynpavlov@gmail.com>
Date: Sun, 25 Sep 2011 21:56:49 +0100
Message-ID: <CAFEAcA_dT-N0qWXqcF_7K1zZ5q3RbrXxF=oJYAvYx_YeFQgpwA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
To: Antony Pavlov <antonynpavlov@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.161.173
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	Aurelien Jarno <aurelien@aurel32.net>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/2] gt64xxx.c: fix length
 modifier in DPRINTF format string
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
X-List-Received-Date: Sun, 25 Sep 2011 20:56:55 -0000

On 25 September 2011 21:02, Antony Pavlov <antonynpavlov@gmail.com> wrote:
> The commit fc2bf44972349b078d8310466c3866615500e67f
> changed the type of val argument of the function gt64120_writel()
> from uint32_t to uint64_t, so we need to change the corresponding
> length modifier from '%x' to '%llx'.

Revised patch looks OK but you forgot to update the commit message :-)


-- PMM

