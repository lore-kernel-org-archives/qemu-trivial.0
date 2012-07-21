Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SsWOK-0004Z3-PF
	for mharc-qemu-trivial@gnu.org; Sat, 21 Jul 2012 05:54:28 -0400
Received: from eggs.gnu.org ([208.118.235.92]:43183)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SsWOI-0004R9-1T
	for qemu-trivial@nongnu.org; Sat, 21 Jul 2012 05:54:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SsWOH-0000HV-5h
	for qemu-trivial@nongnu.org; Sat, 21 Jul 2012 05:54:25 -0400
Received: from mail-bk0-f45.google.com ([209.85.214.45]:63402)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1SsWOF-0000HF-0E; Sat, 21 Jul 2012 05:54:23 -0400
Received: by bkcji1 with SMTP id ji1so3441610bkc.4
	for <multiple recipients>; Sat, 21 Jul 2012 02:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=7MkXXkxmZH5zhtiJ2vOd52VOKJVOy3lyfZFUw3geVt0=;
	b=P3qtGzcIYElEpYIVdQPtRvE7sMWh3nmwX5+GZjJMorBN/Aiweu+qpgoc2lAgI74i03
	trjA7AYzOHQYtfiF4lENU7o7abNiHyjqHsF5BzvAT3MeqTCZEAAK1yzUWB7+WTzi1Ka6
	j2TNhUHH2y2DJGfvRFeSswW4tZ5vjK+7kUBYnHfSE/4R6B5k0p+++B8xjbcDzldEvIFx
	DDMfFr9NRzxMY4XYV/b6tdA3wtHIEhLL8VnrMNJJEkh/95oHw49I+I7lN0v1k52xucoC
	0J9JMcY6YTzhCCYUxO5N2NbCcwyTjP8oqOVGzy/JavmnvOEieXNZu3wPkcEXC4OhaNGw
	sdlg==
MIME-Version: 1.0
Received: by 10.204.130.156 with SMTP id t28mr4638593bks.33.1342864461818;
	Sat, 21 Jul 2012 02:54:21 -0700 (PDT)
Received: by 10.205.64.7 with HTTP; Sat, 21 Jul 2012 02:54:21 -0700 (PDT)
In-Reply-To: <20120716111003.GA6898@stefanha-thinkpad.localdomain>
References: <1342381105-20395-1-git-send-email-lersek@redhat.com>
	<20120716111003.GA6898@stefanha-thinkpad.localdomain>
Date: Sat, 21 Jul 2012 10:54:21 +0100
Message-ID: <CAJSP0QW759meDwyDHSUGHDMuadUNEmFwED=OF_3J7quBtM88dQ@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Laszlo Ersek <lersek@redhat.com>
Content-Type: text/plain; charset=ISO-8859-1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.214.45
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	agraf@suse.de, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] configure: adapt vde test
	to -Werror
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
X-List-Received-Date: Sat, 21 Jul 2012 09:54:27 -0000

On Mon, Jul 16, 2012 at 12:10 PM, Stefan Hajnoczi <stefanha@gmail.com> wrote:
> On Sun, Jul 15, 2012 at 09:38:25PM +0200, Laszlo Ersek wrote:
>> ... after commit 417c9d72 ("configure: add -Werror to QEMU_CFLAGS early")
>>
>> Signed-off-by: Laszlo Ersek <lersek@redhat.com>
>> ---
>>  configure |    2 +-
>>  1 files changed, 1 insertions(+), 1 deletions(-)
>
> Thanks, applied to the trivial patches tree:
> https://github.com/stefanha/qemu/commits/trivial-patches

Peter Maydell's 11 patch series addresses all the other ./configure
-Werror issues too.  You were first but I'm dropping this so
qemu.git/master can solve all issues at once with Peter's series.

Stefan

