Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bk4W8-0004bt-Mp
	for mharc-qemu-trivial@gnu.org; Wed, 14 Sep 2016 03:22:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47718)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bk4W6-0004a0-V7
	for qemu-trivial@nongnu.org; Wed, 14 Sep 2016 03:21:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bk4W4-00017E-Tq
	for qemu-trivial@nongnu.org; Wed, 14 Sep 2016 03:21:57 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:53139)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1bk4Vz-00011x-BD; Wed, 14 Sep 2016 03:21:51 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 8C994417FF;
	Wed, 14 Sep 2016 10:21:47 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id 1952BAAB;
	Wed, 14 Sep 2016 10:21:47 +0300 (MSK)
To: Eduardo Habkost <ehabkost@redhat.com>,
	"Daniel P. Berrange" <berrange@redhat.com>
References: <1465919097-21453-1-git-send-email-berrange@redhat.com>
	<20160614160023.GQ18662@thinpad.lan.raisama.net>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <ef56aa6d-ee2b-37f8-016f-910f8c586b6f@msgid.tls.msk.ru>
Date: Wed, 14 Sep 2016 10:21:47 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.2.0
MIME-Version: 1.0
In-Reply-To: <20160614160023.GQ18662@thinpad.lan.raisama.net>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH] win32: don't run subprocess tests on
 Mingw32 platform
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 14 Sep 2016 07:22:00 -0000

14.06.2016 19:00, Eduardo Habkost wrote:
> On Tue, Jun 14, 2016 at 04:44:57PM +0100, Daniel P. Berrange wrote:
>> The g_test_trap_subprocess() method does not work on the
>> Mingw32 platform, causing the test-qdev-global-props
>> test case to abort
>>
>> (test-logging.exe:230): GLib-ERROR **: g_test_trap_subprocess()
>> failed: Failed to execute helper program (No such file or directory)
>>
>> This failure was introduced a while ago in
>>
>>   commit 2177801a4899bf29108b3d471417a5b4d701ec29
>>   Author: Eduardo Habkost <ehabkost@redhat.com>
>>   Date:   Fri Aug 8 16:03:27 2014 -0300
>>
>>     test-qdev-global-props: Run tests on subprocess
>>
>> Modify the configure time check to avoid enabling this feature
>> on Mingw, rather than trying to rewrite the test to avoid this
>> feature.
>>
> [...]
>> -if test "$glib_subprocess" = "yes" ; then
>> +if test "$glib_subprocess" = "yes" && test "$mingw32" != "yes" ; then
>>    echo "CONFIG_HAS_GLIB_SUBPROCESS_TESTS=y" >> $config_host_mak
>>  fi
>
> I would do the following instead, just in case we have extra code
> looking at $glib_subprocess one day.
>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> ---
> diff --git a/configure b/configure
> index 8c2f90b..642a80b 100755
> --- a/configure
> +++ b/configure
> @@ -2996,7 +2996,7 @@ fi
>
>  # g_test_trap_subprocess added in 2.38. Used by some tests.
>  glib_subprocess=yes
> -if ! $pkg_config --atleast-version=2.38 glib-2.0; then
> +if test "$mingw32" = "yes" || ! $pkg_config --atleast-version=2.38 glib-2.0; then
>      glib_subprocess=no
>  fi

Applied this last version to -trivial, thanks!

/mjt


