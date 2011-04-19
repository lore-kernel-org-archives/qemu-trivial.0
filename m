Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QCH5A-0000JU-9S
	for mharc-qemu-trivial@gnu.org; Tue, 19 Apr 2011 15:59:32 -0400
Received: from eggs.gnu.org ([140.186.70.92]:35910)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>) id 1QCH58-0000IQ-Re
	for qemu-trivial@nongnu.org; Tue, 19 Apr 2011 15:59:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>) id 1QCH57-0005C0-U3
	for qemu-trivial@nongnu.org; Tue, 19 Apr 2011 15:59:30 -0400
Received: from mail-vx0-f173.google.com ([209.85.220.173]:43491)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>)
	id 1QCH55-0005Ba-QA; Tue, 19 Apr 2011 15:59:27 -0400
Received: by vxb41 with SMTP id 41so56758vxb.4
	for <multiple recipients>; Tue, 19 Apr 2011 12:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=suc3Erx9K6hhztRdwvEN/TW+77CWlWAtEDK3xxflRv0=;
	b=wu5nLV8U8Eb0kOn5+764cNmlA9n95jqWPH14z3OEqyN6erdu4cTvH8JxmnfhxygKUi
	2mLE++1CCyKOisKxu8dNOTa8L/6wcbpMuSmwoHdf0ZZkSH++PHxJPNIgtXH+W1ygHAlh
	FCXG9iIy0U9XnLBOWbYSHuZPMbNC/lixGpgpw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	b=Vx3xuznjsJGR+wGSxQkq98tx+VvFINnRO4YryHFP43PnlgEZkL9SH0OYJ55ChrhEP2
	0x4jXJUPSNzaN7HR/qZHAtMboTUJY6zYw3+bas37E0zUKq+L0sFmzaIEKxuvlpbzcu9n
	bFVPwnc+6WSPOpgKvH55R7VqO3BQROib44NFo=
Received: by 10.52.114.133 with SMTP id jg5mr1592006vdb.27.1303243167049; Tue,
	19 Apr 2011 12:59:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.52.115.103 with HTTP; Tue, 19 Apr 2011 12:59:07 -0700 (PDT)
In-Reply-To: <BANLkTik3bYHBHufOzd1D8SAy7G7RjQVH-A@mail.gmail.com>
References: <1303203461-30776-1-git-send-email-peter.maydell@linaro.org>
	<BANLkTi=5edYcRWOahB1hyDxCPtWjyXmHBQ@mail.gmail.com>
	<BANLkTik3bYHBHufOzd1D8SAy7G7RjQVH-A@mail.gmail.com>
From: Blue Swirl <blauwirbel@gmail.com>
Date: Tue, 19 Apr 2011 22:59:07 +0300
Message-ID: <BANLkTik3Xi_0Std-TXRmDOz=WmxB3YhhXA@mail.gmail.com>
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
X-List-Received-Date: Tue, 19 Apr 2011 19:59:31 -0000

On Tue, Apr 19, 2011 at 10:48 PM, Peter Maydell
<peter.maydell@linaro.org> wrote:
> On 19 April 2011 20:37, Blue Swirl <blauwirbel@gmail.com> wrote:
>> On Tue, Apr 19, 2011 at 11:57 AM, Peter Maydell
>> <peter.maydell@linaro.org> wrote:
>>> Work around a SPARC glibc bug which caused the epoll_create1 configure
>>> test to wrongly claim that the function was present. Some versions of
>>> SPARC glibc provided the function in the library but didn't declare
>>> it in the include file; the result is that gcc warns about an implicit
>>> declaration but a link succeeds. So we build the configure test with
>>> -Werror to avoid the test passing but then a -Werror qemu build
>>> failing.
>>
>> But then epoll would not be used.
>
> I think that's fine -- on a system which isn't advertising epoll
> in its include files we shouldn't be trying to use it. It might
> be buggy, or not the same function at all, for instance.
>
> Anybody who actually cares about epoll can upgrade their libc :-)

Maybe epoll is not so interesting as madvise.

But the check is not very specific, there could be some unrelated
warning with the headers. How about checking in the compiled file for
for example EPOLLIN, that should give a clear build failure if the
header is missing?

