Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T9T48-0006GX-36
	for mharc-qemu-trivial@gnu.org; Wed, 05 Sep 2012 23:47:40 -0400
Received: from eggs.gnu.org ([208.118.235.92]:50693)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <riegamaths@gmail.com>) id 1T9T45-00068h-Hr
	for qemu-trivial@nongnu.org; Wed, 05 Sep 2012 23:47:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <riegamaths@gmail.com>) id 1T9T44-0008PN-5T
	for qemu-trivial@nongnu.org; Wed, 05 Sep 2012 23:47:37 -0400
Received: from mail-lpp01m010-f45.google.com ([209.85.215.45]:36498)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <riegamaths@gmail.com>)
	id 1T9T41-0008Oe-JZ; Wed, 05 Sep 2012 23:47:33 -0400
Received: by lagz14 with SMTP id z14so729674lag.4
	for <multiple recipients>; Wed, 05 Sep 2012 20:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=srI573mN6a4bB5COEZtkU3aoZxCD1sL5dnAr3ZxniFs=;
	b=YvryhkhFokxWe8r+oy9OUDMnueb3ry4N58DkUup9mPUmFQGASr8WEm70LjDuPtYQ8/
	q0k8/KWCuooi/PsHwzhiSUQb3nJeh2Ey95PjCa3Ncqt+Co9L6EkzZExpEjdRArMpuE75
	N6D5M2fnWJLhj0BXeA1vM88fPjZDkc2F8T7WEG4A8YPM/knAHaRZKjyx48P70tjYF0oe
	SuQ3G0wQx2eyf56KrCo6VfuikyCkL2SPRUReC6GwGtwLPfGoC9CObvxZiMOFdrpvlHb2
	F/QrhRG1ifVslMuuWvwy/kZQcq9V0iXgrZYWswI0a0mSoXLc11g+QE1OvLqRYg6tbt1R
	BPgA==
MIME-Version: 1.0
Received: by 10.112.24.196 with SMTP id w4mr353055lbf.37.1346903251659; Wed,
	05 Sep 2012 20:47:31 -0700 (PDT)
Received: by 10.112.5.6 with HTTP; Wed, 5 Sep 2012 20:47:31 -0700 (PDT)
In-Reply-To: <50477D9E.1010408@redhat.com>
References: <1346851582-9296-1-git-send-email-riegamaths@gmail.com>
	<50477269.8050807@redhat.com>
	<87d320e9uk.fsf@blackfin.pond.sub.org>
	<50477C74.7050606@redhat.com> <50477D9E.1010408@redhat.com>
Date: Thu, 6 Sep 2012 11:47:31 +0800
Message-ID: <CAOZVR5bpJc7_gJAxsptEzW08HiuYt7txVTKgj7ALsZ5aPBg-Ww@mail.gmail.com>
From: Dunrong Huang <riegamaths@gmail.com>
To: Eric Blake <eblake@redhat.com>
Content-Type: text/plain; charset=ISO-8859-1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.215.45
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Markus Armbruster <armbru@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] block: Don't forget to delete temporary
	file
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
X-List-Received-Date: Thu, 06 Sep 2012 03:47:38 -0000

2012/9/6 Eric Blake <eblake@redhat.com>:
> On 09/05/2012 10:23 AM, Paolo Bonzini wrote:
>> And finally, the whole get_tmp_filename is unsafe because there is a
>> race window between closing and reopening the file, if the directory is
>> writable and does not have the sticky bit.
>>
>> So the patch is an improvement, but there is still something unpleasing
>> in this code...
>
> I absolutely agree that there is a nasty race here.  If you aren't going
> to use the fd, then mktemp() is sufficient (and just as racy, but then
> you are at least honest that you don't care about the race); in all
Yes, using mktemp() in get_tmp_filename() is ok because we dont
care  about race, but for old gcc version, e.g. for version 4.4, we will get
a annoying unsecure warning "warning: the use of `mktemp' is
dangerous, better use `mkstemp'",
which breaks build.

> other situations, if you want a temporary file name but want to avoid a
> race, then it feels like you should be returning the fd from mkstemp()
> still open (or at a bare minimum, auditing ALL callers to make sure they
> only use the temporary name with O_CREAT|O_EXCL, and that they retry in
> a loop in case they lose the race, at which point they are reinventing
> the loop already done on their behalf by mkstemp()...).
>
> --
> Eric Blake   eblake@redhat.com    +1-919-301-3266
> Libvirt virtualization library http://libvirt.org
>



-- 
Best Regards,

Dunrong Huang

