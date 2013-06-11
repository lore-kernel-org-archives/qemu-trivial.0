Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UmSI1-0007QB-F9
	for mharc-qemu-trivial@gnu.org; Tue, 11 Jun 2013 13:23:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44278)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mohankumar.m@gmail.com>) id 1UmSHw-0007Pe-Mm
	for qemu-trivial@nongnu.org; Tue, 11 Jun 2013 13:23:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mohankumar.m@gmail.com>) id 1UmSHs-0002e9-Vc
	for qemu-trivial@nongnu.org; Tue, 11 Jun 2013 13:23:20 -0400
Received: from e28smtp04.in.ibm.com ([122.248.162.4]:60924)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mohankumar.m@gmail.com>) id 1UmSHs-0002do-AS
	for qemu-trivial@nongnu.org; Tue, 11 Jun 2013 13:23:16 -0400
Received: from /spool/local
	by e28smtp04.in.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <mohankumar.m@gmail.com>;
	Tue, 11 Jun 2013 22:47:19 +0530
Received: from d28dlp02.in.ibm.com (9.184.220.127)
	by e28smtp04.in.ibm.com (192.168.1.134) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Tue, 11 Jun 2013 22:47:17 +0530
Received: from d28relay05.in.ibm.com (d28relay05.in.ibm.com [9.184.220.62])
	by d28dlp02.in.ibm.com (Postfix) with ESMTP id D06693940053;
	Tue, 11 Jun 2013 22:53:07 +0530 (IST)
Received: from d28av04.in.ibm.com (d28av04.in.ibm.com [9.184.220.66])
	by d28relay05.in.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	r5BHN11i18612402; Tue, 11 Jun 2013 22:53:02 +0530
Received: from d28av04.in.ibm.com (loopback [127.0.0.1])
	by d28av04.in.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP id
	r5BHN5RH027243; Wed, 12 Jun 2013 03:23:05 +1000
Received: from explorer.ibm.com ([9.79.220.86])
	by d28av04.in.ibm.com (8.14.4/8.13.1/NCO v10.0 AVin) with ESMTP id
	r5BHN2cd027042
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NO);
	Wed, 12 Jun 2013 03:23:04 +1000
From: "M. Mohan Kumar" <mohan@in.ibm.com>
To: Peter Maydell <peter.maydell@linaro.org>, Michael Tokarev <mjt@tls.msk.ru>
In-Reply-To: <CAFEAcA8g7Ck_vdAraiEsKdYBi=VM8PRTCrA9UnA6GAa+JgXUoQ@mail.gmail.com>
References: <1370897240-23490-1-git-send-email-mjt@msgid.tls.msk.ru>
	<CAFEAcA88zpSQTLWSwu6ci7rytTMxkWWqjE4jfb=0Svj+9P8NsQ@mail.gmail.com>
	<51B7183E.6070203@msgid.tls.msk.ru>
	<CAFEAcA8g7Ck_vdAraiEsKdYBi=VM8PRTCrA9UnA6GAa+JgXUoQ@mail.gmail.com>
User-Agent: Notmuch/0.13.2 (http://notmuchmail.org) Emacs/24.1.1
	(x86_64-redhat-linux-gnu)
Date: Tue, 11 Jun 2013 22:53:02 +0530
Message-ID: <87ehc8tvd5.fsf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-MML: No
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 13061117-5564-0000-0000-00000850D088
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 122.248.162.4
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH trivial] configure:
	explicitly disable virtfs if softmmu=no
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
X-List-Received-Date: Tue, 11 Jun 2013 17:23:24 -0000

Peter Maydell <peter.maydell@linaro.org> writes:

How about this approach?

[PATCH] configure: Disable virtfs if softmmu not enabled

Signed-off-by: M. Mohan Kumar <mohan@in.ibm.com>
---
 configure | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/configure b/configure
index 1654413..88c2b0f 100755
--- a/configure
+++ b/configure
@@ -3404,8 +3404,9 @@ if test "$want_tools" = "yes" ; then
     tools="qemu-nbd\$(EXESUF) $tools"
   fi
 fi
-if test "$softmmu" = yes ; then
-  if test "$virtfs" != no ; then
+
+if test "$virtfs" != no ; then
+  if test "$softmmu" = yes ; then
     if test "$cap" = yes && test "$linux" = yes && test "$attr" = yes ; then
       virtfs=yes
       tools="$tools fsdev/virtfs-proxy-helper\$(EXESUF)"
@@ -3415,6 +3416,12 @@ if test "$softmmu" = yes ; then
       fi
       virtfs=no
     fi
+  else
+    if test "$virtfs" = yes; then
+      error_exit "VirtFS is supported only on Linux and requires softmmu"
+    else
+     virtfs=no
+    fi
   fi
   if [ "$linux" = "yes" -o "$bsd" = "yes" -o "$solaris" = "yes" ] ; then
     if [ "$guest_agent" = "yes" ]; then
-- 
1.7.11.7

Tested with following configure options

$ ./configure '--target-list=x86_64-linux-user' --disable-system
[snip]
VirtFS support    no

$ ./configure '--target-list=x86_64-linux-user' --disable-system --enable-virtfs

ERROR: VirtFS is supported only on Linux and requires softmmu

$ ./configure '--target-list=x86_64-softmmu' --enable-virtfs
[snip]
VirtFS support    yes

$ ./configure '--target-list=x86_64-softmmu'
VirtFS support    yes



> On 11 June 2013 13:29, Michael Tokarev <mjt@tls.msk.ru> wrote:
>> 11.06.2013 01:45, Peter Maydell wrote:
>>> This doesn't feel to me like it's quite the right way
>>> to fix this bug. The current code in configure seems
>>> to tangle up (a) was virtfs requested and can we do it?
>>> with (b) what do we need to do if it was? (build some
>>> extra tools) and (c) when does it make sense? not for
>>> linux-user targets. So you end up with an 'else virtfs=no'
>>> clause added in an odd place. If the mess was untangled
>>> then this probably wouldn't be necessary.
>>
>> Um. I don't think that tangling is a bad thing really.
>> Having different variables or options for it will be
>> too bloated, in my opinion.  I don't think there should
>> be anything done with it.
>
> I don't want more variables. I just don't think we
> should have "if not softmmu then do some other thing";
> just check for whether the user asked for virtfs and
> we can do it, and if so set virtfs=yes.
>
>> How about something like this:
>>
>> --- a/configure
>> +++ b/configure
>> @@ -3810,7 +3810,7 @@ fi
>>  if test "$libattr" = "yes" ; then
>>    echo "CONFIG_LIBATTR=y" >> $config_host_mak
>>  fi
>> -if test "$virtfs" = "yes" ; then
>> +if test "$virtfs" = "yes" && test "$target_softmmu" = "yes" ; then
>>    echo "CONFIG_VIRTFS=y" >> $config_host_mak
>>  fi
>
> This seems like a step backwards to me. virtfs=yes should
> just translate straight to CONFIG_VIRTFS and the makefile
> should just not care if it's set if we happen not to be
> building anything virtfs related.
>
>>> Also, disabling building tools and docs in general seems
>>> broken: --disable-tools disables building qemu-img, for
>>> instance, but not its documentation. So maybe we should
>>> fix this by generally making sure we don't build the docs
>>> unless we build the tool as well.
>>
>> This has been addressed by a separate patch sent by afaerber.
>
> That patch didn't touch anything virtfs proxy related.
>
> thanks
> -- PMM


