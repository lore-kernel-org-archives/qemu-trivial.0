Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QbpvA-00037j-Fi
	for mharc-qemu-trivial@gnu.org; Wed, 29 Jun 2011 04:14:52 -0400
Received: from eggs.gnu.org ([140.186.70.92]:55075)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1Qbpv4-00036Y-SZ
	for qemu-trivial@nongnu.org; Wed, 29 Jun 2011 04:14:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1Qbpv1-0004M7-Jq
	for qemu-trivial@nongnu.org; Wed, 29 Jun 2011 04:14:46 -0400
Received: from mail-yx0-f173.google.com ([209.85.213.173]:64743)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1Qbpv1-0004Lj-3X
	for qemu-trivial@nongnu.org; Wed, 29 Jun 2011 04:14:43 -0400
Received: by yxt3 with SMTP id 3so460871yxt.4
	for <qemu-trivial@nongnu.org>; Wed, 29 Jun 2011 01:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=o2w0/GCUWwM4uAJHtvcNhrgMdg4bzREbJvi3bOKpmm0=;
	b=xIrpsgznut1ZQMRADvOKCxbYYYHbD7D/iuI3GLlqJyZEBjvkxk8f/PLP0mOnR98lHd
	Kd2FcArIoPaH6yJUdz58yqVuUhANHvl70EO7A/Qf+1A7heqIDt5zKJWRM6P+7A0lzVy5
	So6q1VYGamQM2f7vK8J88/fzRoLv5daZDVk2A=
MIME-Version: 1.0
Received: by 10.147.89.19 with SMTP id r19mr204908yal.7.1309335281706; Wed, 29
	Jun 2011 01:14:41 -0700 (PDT)
Received: by 10.147.136.16 with HTTP; Wed, 29 Jun 2011 01:14:41 -0700 (PDT)
In-Reply-To: <20110628103221.GB23547@stefanha-thinkpad.localdomain>
References: <4E0970AA.4060501@gmail.com>
	<20110628103221.GB23547@stefanha-thinkpad.localdomain>
Date: Wed, 29 Jun 2011 09:14:41 +0100
Message-ID: <BANLkTi=JfnLRNWONypgXbjK4tcPXhTz1wQ@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Hans N <agenthh@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.213.173
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] Fix debug log option parsing in
	user-mode emulation
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
X-List-Received-Date: Wed, 29 Jun 2011 08:14:49 -0000

On Tue, Jun 28, 2011 at 11:33 AM, Stefan Hajnoczi <stefanha@gmail.com> wrot=
e:
> On Mon, Jun 27, 2011 at 11:11:54PM -0700, Hans N wrote:
>> Fix cpu_str_to_log_mask() to actually use log_mask
>>
>> Signed-off-by: Hans Nielsen <agenthh@gmail.com>
>> ---
>> =A0bsd-user/main.c =A0 =A0| =A0 =A02 +-
>> =A0darwin-user/main.c | =A0 =A02 +-
>> =A0linux-user/main.c =A0| =A0 =A02 +-
>> =A03 files changed, 3 insertions(+), 3 deletions(-)
>
> Thanks, applied to the trivial patches tree:
> http://repo.or.cz/w/qemu/stefanha.git/shortlog/refs/heads/trivial-patches

Edgar E. Iglesias <edgar.iglesias@gmail.com> has already merged an
identical fix into qemu.git:

http://repo.or.cz/w/qemu.git/commitdiff/1dfdcaa83f9ce34aded8bc0669e81753d94=
f1b7d

I am dropping your patch since the issue has been fixed.

Stefan

