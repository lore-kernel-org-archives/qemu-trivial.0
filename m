Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QSGwO-0001P6-EM
	for mharc-qemu-trivial@gnu.org; Thu, 02 Jun 2011 19:04:36 -0400
Received: from eggs.gnu.org ([140.186.70.92]:47149)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1QSGwJ-0001OV-Oj
	for qemu-trivial@nongnu.org; Thu, 02 Jun 2011 19:04:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1QSGwI-0006Up-PJ
	for qemu-trivial@nongnu.org; Thu, 02 Jun 2011 19:04:31 -0400
Received: from mail-yi0-f45.google.com ([209.85.218.45]:53233)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1QSGwE-0006TO-MF; Thu, 02 Jun 2011 19:04:26 -0400
Received: by yib19 with SMTP id 19so652989yib.4
	for <multiple recipients>; Thu, 02 Jun 2011 16:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=4bCanwkVup4ZwJJ47VsYOVbGEdbnXIsOuKF8fp/RQVQ=;
	b=a4Ke5v0C/15XZuj2Xn2XubH7kqqKIuTzYpKoCM+jLExWmnAO3XHQkjlK324brBllJl
	1RI+VguL0Fnjyv8cG1idA6U3RMyngJ/VqWLtXAg/UKvSbfDXUXRCax8Yx13TEsud50Sy
	utDn20WTZ87NiUPi9cvmpvM99owcswcEuuSSM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	b=VM0mRXmHzX8AJfA+ArJLcXIXokbyPXBpoSc/wRXdu0aYbgybpb+V4afR8NxlXhbJQZ
	amzfXiuJYfmXKvP9ro1OODDWD05LAXfnwEsmcFjCugZ32Wf0C/L9t2Baj+HU45MIyQgx
	1tYKbXfDfUAE4pc5kAxReycv44xw1BawM6WU8=
MIME-Version: 1.0
Received: by 10.236.183.5 with SMTP id p5mr1643198yhm.16.1307055865863; Thu,
	02 Jun 2011 16:04:25 -0700 (PDT)
Received: by 10.146.86.2 with HTTP; Thu, 2 Jun 2011 16:04:25 -0700 (PDT)
In-Reply-To: <BANLkTinor25LBJqAbHyqPcJW_7KzpaMhsw@mail.gmail.com>
References: <1306981290-17308-1-git-send-email-cerbere@gmail.com>
	<BANLkTi=hHCo6e0aoF1TypAb06vDN_6e+6A@mail.gmail.com>
	<BANLkTinor25LBJqAbHyqPcJW_7KzpaMhsw@mail.gmail.com>
Date: Fri, 3 Jun 2011 00:04:25 +0100
Message-ID: <BANLkTim_HCrg-uuyABYR0f3L9=JSoQ8TYQ@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Alexandre Raymond <cerbere@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.218.45
Cc: qemu-trivial@nongnu.org,
	=?ISO-8859-1?Q?Andreas_F=E4rber?= <andreas.faerber@web.de>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Fix compilation warning due
 to missing header for sigaction
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
X-List-Received-Date: Thu, 02 Jun 2011 23:04:34 -0000

On Thu, Jun 2, 2011 at 11:55 PM, Alexandre Raymond <cerbere@gmail.com> wrote:
> Should I send a follow-up patch to remove signal.h wherever
> qemu-common.h is already included?

Yes, please.

I didn't know that qemu-common.h pulls in system headers so users
don't need to, I always figured .c files should include what they use.
 But if we use this approach we might as well update the codebase.

Stefan

