Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RxeUC-0006e0-I3
	for mharc-qemu-trivial@gnu.org; Wed, 15 Feb 2012 08:01:28 -0500
Received: from eggs.gnu.org ([140.186.70.92]:46671)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.barcelo@gmail.com>) id 1RxeU1-00066j-7v
	for qemu-trivial@nongnu.org; Wed, 15 Feb 2012 08:01:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.barcelo@gmail.com>) id 1RxeTv-0004cu-5y
	for qemu-trivial@nongnu.org; Wed, 15 Feb 2012 08:01:17 -0500
Received: from mail-pz0-f45.google.com ([209.85.210.45]:35385)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.barcelo@gmail.com>)
	id 1RxeTe-0004XM-Mb; Wed, 15 Feb 2012 08:00:54 -0500
Received: by dadp14 with SMTP id p14so1089124dad.4
	for <multiple recipients>; Wed, 15 Feb 2012 05:00:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=4uAVHKoJxYgmMnHUKPNF4c1iVbrlaqAd+01rNoupyso=;
	b=AX4mW8Z7Gv/+9Tta7k2hfD3vH+1N8nCvAMsPVeOEKDAj+Hd7QjtCM9Qk0Y6rp5mcLB
	1O7CZ94LKC+OQYjVDleTV3T0971WIx+RDuDg0YtMnSFYwAKufIGUQlz2FKaVW1sigmXn
	LQWPoxCUMDiySuYZbPWjJw7EdPUmSkzUUL5G8=
Received: by 10.68.129.105 with SMTP id nv9mr3610550pbb.30.1329310850174; Wed,
	15 Feb 2012 05:00:50 -0800 (PST)
MIME-Version: 1.0
Sender: alex.barcelo@gmail.com
Received: by 10.142.208.6 with HTTP; Wed, 15 Feb 2012 05:00:30 -0800 (PST)
In-Reply-To: <7B11164E-5A9B-4053-97A1-904E9A776F86@suse.de>
References: <CAFKAgTcgMqVpopxTw8+8N005OSOoNM33L2a8DLJvn7Tpa-BGvQ@mail.gmail.com>
	<CAFKAgTfOTniTEteFa5Rkms6PYXxDBFOS7g1VQNU4szXmC6T5Pw@mail.gmail.com>
	<CAFKAgTeS9T=eTo2PQqc5DYwfZq_+8Dj0vCa9zB1X9dVWHziypQ@mail.gmail.com>
	<7B11164E-5A9B-4053-97A1-904E9A776F86@suse.de>
From: Alex Barcelo <abarcelo@ac.upc.edu>
Date: Wed, 15 Feb 2012 14:00:30 +0100
X-Google-Sender-Auth: jSjQeazPq5sj8PUmtNcEFBPSsY0
Message-ID: <CAFKAgTd=1sm6e1v--OtVu2+_be87CFrJaQ8MVL5ci4Y0V8awkw@mail.gmail.com>
To: Alexander Graf <agraf@suse.de>
Content-Type: text/plain; charset=ISO-8859-1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.210.45
Cc: qemu-trivial@nongnu.org, Riku Voipio <riku.voipio@iki.fi>,
	qemu-ppc@nongnu.org, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [TRIVIAL v2] Bad zero comparison
	for sas_ss_flags on powerpc
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
X-List-Received-Date: Wed, 15 Feb 2012 13:01:26 -0000

On Wed, Feb 15, 2012 at 09:35, Alexander Graf <agraf@suse.de> wrote:
> On 15.02.2012, at 07:55, Alex Barcelo wrote:
>> ping? is this ok? Or it is not trivial at all, and better do a normal patch? And write it better?
>
> The patch is fine, but it's not trivial. It's a ppc patch, hence it should've gotten CC'ed
> to qemu-ppc :). Also, whatever mailer you used to send the patch line wrapped it:
> ...
>
> I'll fix it up and apply it to ppc-next.

Sorry for the inconvenience, and thanks a lot!

