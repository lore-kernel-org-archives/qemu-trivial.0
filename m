Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YyL3D-00058r-NF
	for mharc-qemu-trivial@gnu.org; Fri, 29 May 2015 10:14:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37308)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1YyL3A-00053I-SC
	for qemu-trivial@nongnu.org; Fri, 29 May 2015 10:14:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1YyL39-0004hV-Tm
	for qemu-trivial@nongnu.org; Fri, 29 May 2015 10:14:16 -0400
Received: from static.88-198-71-155.clients.your-server.de
	([88.198.71.155]:35386 helo=socrates.bennee.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>)
	id 1YyL35-0004gS-Gr; Fri, 29 May 2015 10:14:11 -0400
Received: from localhost ([127.0.0.1] helo=zen.linaro.local)
	by socrates.bennee.com with esmtp (Exim 4.80)
	(envelope-from <alex.bennee@linaro.org>)
	id 1YyMNP-0005Rc-0N; Fri, 29 May 2015 17:39:15 +0200
References: <1432897012-1423-1-git-send-email-alex.bennee@linaro.org>
	<55684995.3070205@redhat.com>
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Paolo Bonzini <pbonzini@redhat.com>
In-reply-to: <55684995.3070205@redhat.com>
Date: Fri, 29 May 2015 15:14:20 +0100
Message-ID: <877frrii83.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 127.0.0.1
X-SA-Exim-Mail-From: alex.bennee@linaro.org
X-SA-Exim-Scanned: No (on socrates.bennee.com); SAEximRunCond expanded to false
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 88.198.71.155
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] configure: don't apply -O2 if
	extra-cflags sets -O
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
X-List-Received-Date: Fri, 29 May 2015 14:14:18 -0000


Paolo Bonzini <pbonzini@redhat.com> writes:

> On 29/05/2015 12:56, Alex Bennée wrote:
>> If your trying to debug and want to force -O0 then don't allow the
>> configure script to try and set -O2. You can use --enable-debug but that
>> enables a lot more stuff by default.
>> 
>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>> ---
>>  configure | 5 ++++-
>>  1 file changed, 4 insertions(+), 1 deletion(-)
>> 
>> diff --git a/configure b/configure
>> index b707429..be1f354 100755
>> --- a/configure
>> +++ b/configure
>> @@ -4240,7 +4240,10 @@ if test "$gcov" = "yes" ; then
>>    CFLAGS="-fprofile-arcs -ftest-coverage -g $CFLAGS"
>>    LDFLAGS="-fprofile-arcs -ftest-coverage $LDFLAGS"
>>  elif test "$debug" = "no" ; then
>> -  CFLAGS="-O2 -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=2 $CFLAGS"
>> +    if test "${EXTRA_CFLAGS#*-O}" = "$EXTRA_CFLAGS"; then
>> +        CFLAGS="-O2 $CFLAGS"
>> +    fi
>> +    CFLAGS="-U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=2 $CFLAGS"
>>  fi
>>  
>>  ##########################################
>> 
>
> Why aren't EXTRA_CFLAGS applied _after_ CFLAGS instead of before?

You mean just do:

diff --git a/configure b/configure
index b707429..f13831a 100755
--- a/configure
+++ b/configure
@@ -353,7 +353,7 @@ for opt do
   ;;
   --cpu=*) cpu="$optarg"
   ;;
-  --extra-cflags=*) QEMU_CFLAGS="$optarg $QEMU_CFLAGS"
+  --extra-cflags=*) QEMU_CFLAGS="$QEMU_CFLAGS $optarg"
                     EXTRA_CFLAGS="$optarg"
   ;;
   --extra-ldflags=*) LDFLAGS="$optarg $LDFLAGS"

>
> Paolo

I guess at the time I was trying to be clean and avoiding multiple -O
calls. But I guess that will have the same effect.

-- 
Alex Bennée

