Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Tv5Sg-0005Zo-7Y
	for mharc-qemu-trivial@gnu.org; Tue, 15 Jan 2013 07:17:50 -0500
Received: from eggs.gnu.org ([208.118.235.92]:41879)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <v.e.evard@gmail.com>) id 1Tv5Sc-0005OC-AN
	for qemu-trivial@nongnu.org; Tue, 15 Jan 2013 07:17:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <v.e.evard@gmail.com>) id 1Tv5SX-0002FR-Va
	for qemu-trivial@nongnu.org; Tue, 15 Jan 2013 07:17:46 -0500
Received: from mail-la0-f53.google.com ([209.85.215.53]:44436)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <v.e.evard@gmail.com>)
	id 1Tv5SO-0002DA-FN; Tue, 15 Jan 2013 07:17:32 -0500
Received: by mail-la0-f53.google.com with SMTP id fn20so22937lab.26
	for <multiple recipients>; Tue, 15 Jan 2013 04:17:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:message-id:date:from:user-agent:mime-version:to:cc
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=i3rNT9Kq1qDkswOXB4QkANLEXqyJbFJArDFGEBypAIY=;
	b=BU/XsuQvARJw6+DOzM1coU4U+vXqbOrzm8Vlm9tMdTkztU1Z9kfkiyT9oc4XD1y4G2
	49fAdHHoP3WPrgyykeJOqo00rkLJccTqm4W8XmckXh7tL66rPeXwyF6w7+EmHXxSkDO0
	s/7Y4wozr4NuKtSSghS5pJYsGsTC3DsiaybDaH2CmkYap31PrRG2PoooqBW9lHYF1cVA
	Dzd8RJypdpz0wWQFy0LqfZHKdrkXmjwT3bQL4ZiW/EgREewnZWoRwR5STyIafbDJafN1
	x+/AP/pufuldhoBUTDuoTdZvEcSi6ph6bXQ7xmvzfUiSlzEI+lfcp4YCpA8czPXzWGly
	mNgw==
X-Received: by 10.152.132.69 with SMTP id os5mr85203417lab.15.1358252251054;
	Tue, 15 Jan 2013 04:17:31 -0800 (PST)
Received: from [192.168.1.131] (host-164-152-66-217.spbmts.ru.
	[217.66.152.164])
	by mx.google.com with ESMTPS id f8sm6691019lbg.2.2013.01.15.04.17.27
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 15 Jan 2013 04:17:29 -0800 (PST)
Message-ID: <50F548D4.90903@gmail.com>
Date: Tue, 15 Jan 2013 16:17:24 +0400
From: Vadim Evard <v.e.evard@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.11) Gecko/20121122 Icedove/10.0.11
MIME-Version: 1.0
To: Stefan Hajnoczi <stefanha@gmail.com>
References: <50E1BDC3.5040604@gmail.com> <50F00ACC.8020606@gmail.com>
	<20130115094933.GA2654@stefanha-thinkpad.redhat.com>
In-Reply-To: <20130115094933.GA2654@stefanha-thinkpad.redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.215.53
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [Qemu-devel] [PATCH v2] configure: try pkg-config
 for curses
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
X-List-Received-Date: Tue, 15 Jan 2013 12:17:49 -0000

Static linkikng against ncurses may require explicit -ltinfo.
In case -lcurses and -lncurses both didn't work give pkg-config a
chance.

Fixes #1094786 for me.

Signed-off-by: Vadim Evard <v.e.evard@gmail.com>
---
  configure |    5 ++++-
  1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/configure b/configure
index c908f66..40473a9 100755
--- a/configure
+++ b/configure
@@ -2039,7 +2039,7 @@ fi
  if test "$mingw32" = "yes" ; then
      curses_list="-lpdcurses"
  else
-    curses_list="-lncurses -lcurses"
+    curses_list="-lncurses:-lcurses:$($pkg_config --libs ncurses)"
  fi

  if test "$curses" != "no" ; then
@@ -2052,13 +2052,16 @@ int main(void) {
    return s != 0;
  }
  EOF
+  IFS=:
    for curses_lib in $curses_list; do
+    unset IFS
      if compile_prog "" "$curses_lib" ; then
        curses_found=yes
        libs_softmmu="$curses_lib $libs_softmmu"
        break
      fi
    done
+  unset IFS
    if test "$curses_found" = "yes" ; then
      curses=yes
    else
-- 
1.7.10.4



On 15.01.2013 13:49, Stefan Hajnoczi wrote:
> On Fri, Jan 11, 2013 at 04:51:24PM +0400, Vadim Evard wrote:
>> ping
>>
>> Пнд 31 Дек 2012 20:30:59, Vadim Evard писал:
>>> configure: try pkg-config for curses
>>>
>>> Static linkikng against ncurses may require explicit -ltinfo.
>>> In case -lcurses and -lncurses both didn't work give pkg-config a
>>> chance.
>>>
>>> Signed-off-by: Vadim Evard<v.e.evard@gmail.com>
>>> ---
>>> configure | 4 +++-
>>> 1 file changed, 3 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/configure b/configure
>>> index b0c7e54..16280e2 100755
>>> --- a/configure
>>> +++ b/configure
>>> @@ -2030,7 +2030,7 @@ fi
>>> if test "$mingw32" = "yes" ; then
>>> curses_list="-lpdcurses"
>>> else
>>> - curses_list="-lncurses -lcurses"
>>> + curses_list="-lncurses:-lcurses:$($pkg_config --libs ncurses)"
>>> fi
>>>
>>> if test "$curses" != "no" ; then
>>> @@ -2043,7 +2043,9 @@ int main(void) {
>>> return s != 0;
>>> }
>>> EOF
>>> + IFS=:
>>> for curses_lib in $curses_list; do
>>> + unset IFS
>>> if compile_prog "" "$curses_lib" ; then
>>> curses_found=yes
>>> libs_softmmu="$curses_lib $libs_softmmu"
>
> Please also unset IFS after the loop so there will never be a problem if
> curses_list="".
>
> Stefan

