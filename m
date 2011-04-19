Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QCGuj-000776-Ir
	for mharc-qemu-trivial@gnu.org; Tue, 19 Apr 2011 15:48:45 -0400
Received: from eggs.gnu.org ([140.186.70.92]:47399)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1QCGuh-00073u-Li
	for qemu-trivial@nongnu.org; Tue, 19 Apr 2011 15:48:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1QCGuY-0003fb-OW
	for qemu-trivial@nongnu.org; Tue, 19 Apr 2011 15:48:43 -0400
Received: from mail-vx0-f173.google.com ([209.85.220.173]:37912)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>)
	id 1QCGuJ-0003ZJ-MI; Tue, 19 Apr 2011 15:48:19 -0400
Received: by vxb41 with SMTP id 41so47686vxb.4
	for <multiple recipients>; Tue, 19 Apr 2011 12:48:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.52.69.69 with SMTP id c5mr2338157vdu.222.1303242498546; Tue,
	19 Apr 2011 12:48:18 -0700 (PDT)
Received: by 10.52.165.106 with HTTP; Tue, 19 Apr 2011 12:48:18 -0700 (PDT)
In-Reply-To: <BANLkTi=5edYcRWOahB1hyDxCPtWjyXmHBQ@mail.gmail.com>
References: <1303203461-30776-1-git-send-email-peter.maydell@linaro.org>
	<BANLkTi=5edYcRWOahB1hyDxCPtWjyXmHBQ@mail.gmail.com>
Date: Tue, 19 Apr 2011 20:48:18 +0100
Message-ID: <BANLkTik3bYHBHufOzd1D8SAy7G7RjQVH-A@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
To: Blue Swirl <blauwirbel@gmail.com>
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
X-List-Received-Date: Tue, 19 Apr 2011 19:48:44 -0000

On 19 April 2011 20:37, Blue Swirl <blauwirbel@gmail.com> wrote:
> On Tue, Apr 19, 2011 at 11:57 AM, Peter Maydell
> <peter.maydell@linaro.org> wrote:
>> Work around a SPARC glibc bug which caused the epoll_create1 configure
>> test to wrongly claim that the function was present. Some versions of
>> SPARC glibc provided the function in the library but didn't declare
>> it in the include file; the result is that gcc warns about an implicit
>> declaration but a link succeeds. So we build the configure test with
>> -Werror to avoid the test passing but then a -Werror qemu build
>> failing.
>
> But then epoll would not be used.

I think that's fine -- on a system which isn't advertising epoll
in its include files we shouldn't be trying to use it. It might
be buggy, or not the same function at all, for instance.

Anybody who actually cares about epoll can upgrade their libc :-)

-- PMM

