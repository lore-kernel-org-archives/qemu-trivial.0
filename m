Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QTFON-0006UZ-0q
	for mharc-qemu-trivial@gnu.org; Sun, 05 Jun 2011 11:37:31 -0400
Received: from eggs.gnu.org ([140.186.70.92]:60115)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>) id 1QTFOK-0006U9-Dy
	for qemu-trivial@nongnu.org; Sun, 05 Jun 2011 11:37:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>) id 1QTFOJ-0000Cs-DP
	for qemu-trivial@nongnu.org; Sun, 05 Jun 2011 11:37:28 -0400
Received: from mail-qw0-f45.google.com ([209.85.216.45]:46305)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>)
	id 1QTFOG-0000CX-SL; Sun, 05 Jun 2011 11:37:25 -0400
Received: by qwj8 with SMTP id 8so1660156qwj.4
	for <multiple recipients>; Sun, 05 Jun 2011 08:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=s8xXnS1AHGIWGE1MZxz1TgB++5cGzkKHz6Hy6xM42Ow=;
	b=UkcFkmt1ZO2G3E3bVHKH3E/hSFg4weTl/Zj7fvi5nBIy1rQIlCfi4bOSF3yQP3q9c8
	9sTWFpmYOEnKPbcZciA75T5ASo4yfXI8hHFyRnnarZKE5R3tEnOtT9CwD7v0TIOCKM7m
	GG3iALJg+9IpfQI+3/HH+WxLQr7OEaEGfXkL4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	b=G1eFcdQt4GuwPJos5+BuStvCm1IlG5r38mb4k0fa8ZI19Mk+Hawiip00OjBGXsRbWg
	4Gyy6IQV9aSMWRMz8uEB5cPT39vpJotPUCJqgdm1PlBp7RNN4asfCDUldlKsrfVsrbIl
	hkEX87CzEpoIwh6Ds1yS7b8/oXojwtZB6o92Y=
Received: by 10.224.187.12 with SMTP id cu12mr989328qab.67.1307288244375; Sun,
	05 Jun 2011 08:37:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.224.45.202 with HTTP; Sun, 5 Jun 2011 08:37:04 -0700 (PDT)
In-Reply-To: <1307246220-61006-1-git-send-email-cerbere@gmail.com>
References: <1307246220-61006-1-git-send-email-cerbere@gmail.com>
From: Blue Swirl <blauwirbel@gmail.com>
Date: Sun, 5 Jun 2011 18:37:04 +0300
Message-ID: <BANLkTikeBgGTH+DrL72QyK8z-jJpcPgqhw@mail.gmail.com>
To: Alexandre Raymond <cerbere@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.216.45
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Correct and standardize
 header guards in all header files
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
X-List-Received-Date: Sun, 05 Jun 2011 15:37:29 -0000

On Sun, Jun 5, 2011 at 6:57 AM, Alexandre Raymond <cerbere@gmail.com> wrote:
> As per ISO/IEC 9899, Section 7.1.3 on reserved identifiers,
> identifiers starting with an underscore are reserved.
>
> Therefore:
> 1) Rename all incorrect header guards
>
> While I'm at it:
> 2) Standardize header guards to "#ifndef SOMETHING_H"
> 3) Repeat the header guard identifier after the closing "#endif"

Nice. Could you also standardize the path component, for example
hw/xyz.h -> HW_XYZ_H, or maybe rather QEMU_HW_XYZ_H?

