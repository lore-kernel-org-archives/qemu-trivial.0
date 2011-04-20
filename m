Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QCaJg-000667-9k
	for mharc-qemu-trivial@gnu.org; Wed, 20 Apr 2011 12:31:48 -0400
Received: from eggs.gnu.org ([140.186.70.92]:48861)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>) id 1QCaJd-00060t-TD
	for qemu-trivial@nongnu.org; Wed, 20 Apr 2011 12:31:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>) id 1QCaJc-0007QE-TC
	for qemu-trivial@nongnu.org; Wed, 20 Apr 2011 12:31:45 -0400
Received: from mail-vx0-f173.google.com ([209.85.220.173]:48326)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>)
	id 1QCaJa-0007Px-P3; Wed, 20 Apr 2011 12:31:42 -0400
Received: by vxb41 with SMTP id 41so735195vxb.4
	for <multiple recipients>; Wed, 20 Apr 2011 09:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Pcqpgo/jH5GwaII0Gag+cp4Q/VXweVEMu1JClUUuucw=;
	b=ofDLo2pcn5nbXHxk7MtJYz5gTW8TB5BWaYyQuzvaH4M+s4suM47jq2KM5/LmB5Va80
	VSnGEVYcLjoAa6hN7Tzzcqj+aSmXvpEbxqy73kEeQfWolAivZB/6CQ/6v6tMZwpSQpNW
	djJS9cN1ni5bxrJ6GrNZe9y3HJT0NDvVWlTYo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	b=TgzDWv44rVZdZumjiNOcTnpDWNrDJx3K7KishcoWfd8lWuRxt4cJqvacJ9a5EJUXZs
	I6Es4jevwkr233L5nNWnbR5CO/ElWDDSsdGiiKnLWlTgSth3VKB9yyq/0Tl8CvlT6I5O
	fo8mhcLzS0To/OG8+gdxA+rNcKGqIWXTT1aew=
Received: by 10.52.95.196 with SMTP id dm4mr1731015vdb.147.1303317102064; Wed,
	20 Apr 2011 09:31:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.52.115.103 with HTTP; Wed, 20 Apr 2011 09:31:22 -0700 (PDT)
In-Reply-To: <BANLkTimCYjx1JjT1Wb-Rt19TPG8pKfrGxA@mail.gmail.com>
References: <1303203461-30776-1-git-send-email-peter.maydell@linaro.org>
	<BANLkTi=5edYcRWOahB1hyDxCPtWjyXmHBQ@mail.gmail.com>
	<BANLkTik3bYHBHufOzd1D8SAy7G7RjQVH-A@mail.gmail.com>
	<BANLkTik3Xi_0Std-TXRmDOz=WmxB3YhhXA@mail.gmail.com>
	<BANLkTinvEQJH46DTuJOpADo30SqJ2V=xBg@mail.gmail.com>
	<BANLkTi=Rnq-5OPDSEMPHZmjhQXRPLddWxA@mail.gmail.com>
	<BANLkTimCYjx1JjT1Wb-Rt19TPG8pKfrGxA@mail.gmail.com>
From: Blue Swirl <blauwirbel@gmail.com>
Date: Wed, 20 Apr 2011 19:31:22 +0300
Message-ID: <BANLkTi=AFwiHd_cWV62buQv3=0U9wQDX3w@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.220.173
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] configure: Make
 epoll_create1 test work around SPARC glibc bug
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <http://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <http://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 20 Apr 2011 16:31:46 -0000

On Wed, Apr 20, 2011 at 9:53 AM, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 19 April 2011 21:36, Blue Swirl <blauwirbel@gmail.com> wrote:
>> Sorry, I just picked a define without much thought. A more specific
>> one would be flags parameter of epoll_create1(), like EPOLL_CLOEXEC or
>> EPOLL_NONBLOCK. We don't use them now since the target system call
>> argument is passed untranslated to host, but that is actually not
>> correct, since the bit definitions could be different. So checking for
>> one of those should be OK.
>
> Unfortunately the header file on the system in question defines
> both EPOLL_CLOEXEC and EPOLL_NONBLOCK even though it doesn't
> prototype epoll_create1(). So this idea won't work.
> The bug we are effectively trying to work around is the one fixed
> by this libc patch:
> http://sourceware.org/ml/libc-alpha/2010-08/msg00128.html
>
> The only problem with the header is that it doesn't declare the
> function, so the only way to detect it is to do something that
> will fail if the function isn't declared, like compiling -Werror.

This also fails without -Werror:
#include <sys/epoll.h>

int main(void)
{
    epoll_create1;
    return 0;
}

