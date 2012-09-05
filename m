Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T9F6I-00057u-AF
	for mharc-qemu-trivial@gnu.org; Wed, 05 Sep 2012 08:52:58 -0400
Received: from eggs.gnu.org ([208.118.235.92]:58210)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <riegamaths@gmail.com>) id 1T9F6B-0004l0-3x
	for qemu-trivial@nongnu.org; Wed, 05 Sep 2012 08:52:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <riegamaths@gmail.com>) id 1T9F67-0007Ns-6q
	for qemu-trivial@nongnu.org; Wed, 05 Sep 2012 08:52:51 -0400
Received: from mail-lb0-f173.google.com ([209.85.217.173]:45615)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <riegamaths@gmail.com>)
	id 1T9F61-0007MY-PF; Wed, 05 Sep 2012 08:52:42 -0400
Received: by lbbgm13 with SMTP id gm13so322960lbb.4
	for <multiple recipients>; Wed, 05 Sep 2012 05:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=1dyuFTC3h5m2Ihc+aY8KRINiC88THTgfvD4h65c/U80=;
	b=kw/nk4vB7euCjuaNtJ5zIXKPY4a4GmAScmmHPQu0hROjJgcukLwk/+1ceSXjniDFoo
	y0xDBlXutC3Xh7N4K+0ITHxfuqVK8xuKhQOJqbgqgQCRkU8qHTvmdElRx4hRJISL7opZ
	u8xjWB3Qy31RZGSCLPElocxBUVtEbkVGn61gF4yCAdhopRaPo6j1iKpS0PSphJr0WKiF
	w+SX6Kk6abM0K8diyAd0YLAzwZQ6hrNaHs53+qFvg4EP5MbJIVsWrNWdegXR/1L4AebD
	A9zeFosV9Kke4eb8KGzl6Hdpe+Oc6OPNCgtCX9hPbVlH5CVKQr0/wOiXUCzPY0USFCL/
	IUqw==
MIME-Version: 1.0
Received: by 10.112.24.196 with SMTP id w4mr7439649lbf.37.1346849560297; Wed,
	05 Sep 2012 05:52:40 -0700 (PDT)
Received: by 10.112.5.6 with HTTP; Wed, 5 Sep 2012 05:52:40 -0700 (PDT)
In-Reply-To: <50472B0E.4080205@redhat.com>
References: <1346833574-26193-1-git-send-email-riegamaths@gmail.com>
	<20120905094003.GD4786@stefanha-thinkpad.localdomain>
	<50472B0E.4080205@redhat.com>
Date: Wed, 5 Sep 2012 20:52:40 +0800
Message-ID: <CAOZVR5a6uiWAF3XT-u9gBef21ecOz5oKhy9Pg71fdwX0L=oBMw@mail.gmail.com>
From: Dunrong Huang <riegamaths@gmail.com>
To: Kevin Wolf <kwolf@redhat.com>
Content-Type: text/plain; charset=GB2312
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.217.173
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] block: output more error
 messages if failed to create temporary snapshot
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
X-List-Received-Date: Wed, 05 Sep 2012 12:52:57 -0000

2012/9/5 Kevin Wolf <kwolf@redhat.com>:
> Am 05.09.2012 11:40, schrieb Stefan Hajnoczi:
>> On Wed, Sep 05, 2012 at 04:26:14PM +0800, riegamaths@gmail.com wrote:
>>> From: Dunrong Huang <riegamaths@gmail.com>
>>>
>>> If we failed to create temporary snapshot, the error message did not ma=
tch
>>> with the error, for example:
>>>
>>> $ TMPDIR=3D/tmp/bad_path qemu-system-x86_64 -enable-kvm debian.qcow2 -s=
napshot
>>> qemu-system-x86_64: -enable-kvm: could not open disk image /home/mathsl=
inux/Images/debian.qcow2: No such file or directory
>>>
>>> Indeed, the file which cant be created is /tmp/bad_path/vl.xxxxxx,  not
>>> debian.qcow2. so the error message makes users feel confused.
>>>
>>> Signed-off-by: Dunrong Huang <riegamaths@gmail.com>
>>> ---
>>>  block.c | 2 ++
>>>  1 =B8=F6=CE=C4=BC=FE=B1=BB=D0=DE=B8=C4=A3=AC=B2=E5=C8=EB 2 =D0=D0(+)
>>>
>>> diff --git a/block.c b/block.c
>>> index 470bdcc..c9e5140 100644
>>> --- a/block.c
>>> +++ b/block.c
>>> @@ -434,6 +434,8 @@ int get_tmp_filename(char *filename, int size)
>>>      }
>>>      fd =3D mkstemp(filename);
>>>      if (fd < 0 || close(fd)) {
>>> +        fprintf(stderr, "Could not create temporary snapshot in %s dir=
ectory: "
>>> +                "%s\n", tmpdir, strerror(errno));
>>
>> The error message is fine for fd < 0 but not for close(0) !=3D 0.  Also,
>> close(2) is allowed to change errno (even on success) so this is not
>> portable and could clobber the errno value.
>
> I don't think this error message is fine in get_tmp_filename(). This
> function happens to be used for temporary snapshots, but this is not
> part of its interface. Today it's also used in vvfat and there the
> message would only be confusing. Other use cases may be introduced in
> the future.
Sorry, I forgot that get_tmp_filename() is a public interface.
>
> If you want to introduce an error message, do it in the caller.
>
> Kevin



--=20
Best Regards,

Dunrong Huang

