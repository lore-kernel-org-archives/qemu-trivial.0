Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QTFV6-0007JS-Pe
	for mharc-qemu-trivial@gnu.org; Sun, 05 Jun 2011 11:44:28 -0400
Received: from eggs.gnu.org ([140.186.70.92]:53802)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>) id 1QTFV4-0007Iy-1x
	for qemu-trivial@nongnu.org; Sun, 05 Jun 2011 11:44:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>) id 1QTFV3-000202-2L
	for qemu-trivial@nongnu.org; Sun, 05 Jun 2011 11:44:26 -0400
Received: from mail-qy0-f173.google.com ([209.85.216.173]:46690)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>)
	id 1QTFV0-0001zf-R4; Sun, 05 Jun 2011 11:44:22 -0400
Received: by qyk36 with SMTP id 36so479650qyk.4
	for <multiple recipients>; Sun, 05 Jun 2011 08:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=K5n5Ox/rTCVfjJE7dmzO+JEM797K1bawLZ82I3waCpw=;
	b=kYD0aEP4gELWk4OcR6hWQ1YM9faVWcsayYCgHOba8FR5MtjFPaNw6AlrANClSC/EIT
	4rGa3DJNuoOrYvxbTXKmcKKq4qYfTMmjoPLA8R7FIjxH6kSdt3JRB7BPDUTsKKMJ6SzO
	WvaGbIqb5JY0TvY2LPe/rUYjkVW9xu8S1sO6Y=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	b=tczE/BBMGiM4xx2Tt/CIuU/PXhFa3BM/QrwG0gIu9wS7xVDyB94iiMOZyFf2+C1Wlt
	Ymo1iSG+KpoNTK9kOQX01C3qVTQ448IWXx4Ybd0pkdEpNRKEqJfPIwv3BfNFDblgVQTO
	l4A30TyPWAw7Nj4PMxqlkmHKJKdzxCopeqD70=
Received: by 10.224.219.68 with SMTP id ht4mr1246465qab.217.1307288661100;
	Sun, 05 Jun 2011 08:44:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.224.45.202 with HTTP; Sun, 5 Jun 2011 08:44:01 -0700 (PDT)
In-Reply-To: <1307071609-1165-1-git-send-email-cerbere@gmail.com>
References: <1307071609-1165-1-git-send-email-cerbere@gmail.com>
From: Blue Swirl <blauwirbel@gmail.com>
Date: Sun, 5 Jun 2011 18:44:01 +0300
Message-ID: <BANLkTimyRHr2DWkNqEZcLu9Hw1fGtbvNSw@mail.gmail.com>
To: Alexandre Raymond <cerbere@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.216.173
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Fix compilation warning due
 to missing header for sigaction (followup)
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
X-List-Received-Date: Sun, 05 Jun 2011 15:44:27 -0000

On Fri, Jun 3, 2011 at 6:26 AM, Alexandre Raymond <cerbere@gmail.com> wrote:
> This patch removes all references to signal.h when qemu-common.h is included
> as they become redundant.

This breaks the build. Maybe it depends on some previous patch? If so,
it would be nice to submit the patches as a series so that the patches
can be tested, now I could not find the other patch.

