Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QQPO6-0006HR-Mz
	for mharc-qemu-trivial@gnu.org; Sat, 28 May 2011 15:41:30 -0400
Received: from eggs.gnu.org ([140.186.70.92]:53591)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1QQPO4-0006BE-4l
	for qemu-trivial@nongnu.org; Sat, 28 May 2011 15:41:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1QQPO3-0004C2-9q
	for qemu-trivial@nongnu.org; Sat, 28 May 2011 15:41:28 -0400
Received: from mail-gx0-f173.google.com ([209.85.161.173]:37211)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1QQPO1-0004BC-Cw; Sat, 28 May 2011 15:41:25 -0400
Received: by gxk26 with SMTP id 26so1320002gxk.4
	for <multiple recipients>; Sat, 28 May 2011 12:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=aAHpVhClEEAmffokfzBU+9wsl6ci5r/yQwEo3SafHhY=;
	b=h9mFEW8u/zXDnhLYNFqFLvV/eFAFd7apBh+ndCsGQQcZtsqMGTdQeg3MVz47sYUtC5
	p4Nui5ow9X6KVyVG5JKhdWLRsjE4Y3apCuhXfdTsL3a2b9Mwo/6rDGHJVyz8zyHR+IFa
	nsJTOYraTXUhsAvyXzGPl3rIAyNIeqrTA2AE8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	b=Z10WfK2fOSFpZNEwXdQHv8yEFOu/yznAOTjY66RwmtqcjMH5BrTciguX4+ZZ9TfqKM
	H/qPDf1tLY/ZEGZzIKLuE/824+4GeTCELK0f7vNOUb7eWy6HnmHxSArfAgmCU9RO7CRZ
	Oi9bLQXkW7p/hId2p1eVJltqYcYvLtWUPNrak=
MIME-Version: 1.0
Received: by 10.146.11.7 with SMTP id 7mr3021716yak.4.1306611684079; Sat, 28
	May 2011 12:41:24 -0700 (PDT)
Received: by 10.146.86.2 with HTTP; Sat, 28 May 2011 12:41:24 -0700 (PDT)
In-Reply-To: <77A77737-0259-40D1-B662-E6009057999B@web.de>
References: <1306516951-31105-1-git-send-email-cerbere@gmail.com>
	<77A77737-0259-40D1-B662-E6009057999B@web.de>
Date: Sat, 28 May 2011 20:41:24 +0100
Message-ID: <BANLkTimRdJeqHtYm6P3FJGpLC-5CVj4uWA@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
To: =?ISO-8859-1?Q?Andreas_F=E4rber?= <andreas.faerber@web.de>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.161.173
Cc: Alexandre Raymond <cerbere@gmail.com>, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org
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
X-List-Received-Date: Sat, 28 May 2011 19:41:29 -0000

On Sat, May 28, 2011 at 3:55 PM, Andreas F=E4rber <andreas.faerber@web.de> =
wrote:
> Hello,
>
> Am 27.05.2011 um 19:22 schrieb Alexandre Raymond:
>
>> The following series contains trivial patches to fix several minor issue=
s
>> encountered while compiling qemu under OSX 10.6.7.
>>
>> I used [./configure --disable-bsd-user --disable-darwin-user
>> --enable-io-thread]
>> to configure the build.
>
> In the future, please cc me for Darwin. I'll review them tomorrow.

Okay these patches will go through the Andreas' tree.  I won't be
merging any of them into qemu-trivial.

Stefan

