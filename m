Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1W6I9O-0004kC-Ua
	for mharc-qemu-trivial@gnu.org; Thu, 23 Jan 2014 06:08:46 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56107)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stewart@river.localdomain>) id 1W6I9F-0004ja-NN
	for qemu-trivial@nongnu.org; Thu, 23 Jan 2014 06:08:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stewart@river.localdomain>) id 1W6I97-0000ZR-Tg
	for qemu-trivial@nongnu.org; Thu, 23 Jan 2014 06:08:37 -0500
Received: from e23smtp03.au.ibm.com ([202.81.31.145]:35972)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stewart@river.localdomain>) id 1W6I97-0000Y5-7N
	for qemu-trivial@nongnu.org; Thu, 23 Jan 2014 06:08:29 -0500
Received: from /spool/local
	by e23smtp03.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <stewart@river.localdomain>;
	Thu, 23 Jan 2014 21:08:23 +1000
Received: from d23dlp03.au.ibm.com (202.81.31.214)
	by e23smtp03.au.ibm.com (202.81.31.209) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Thu, 23 Jan 2014 21:08:21 +1000
Received: from d23relay03.au.ibm.com (d23relay03.au.ibm.com [9.190.235.21])
	by d23dlp03.au.ibm.com (Postfix) with ESMTP id 8140D3578054;
	Thu, 23 Jan 2014 22:08:20 +1100 (EST)
Received: from d23av04.au.ibm.com (d23av04.au.ibm.com [9.190.235.139])
	by d23relay03.au.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	s0NB86VA55050456; Thu, 23 Jan 2014 22:08:07 +1100
Received: from d23av04.au.ibm.com (localhost [127.0.0.1])
	by d23av04.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
	s0NB8J3M015818; Thu, 23 Jan 2014 22:08:19 +1100
Received: from river.localdomain (wecm00-9-185-86-246.au.ibm.com
	[9.185.86.246])
	by d23av04.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
	s0NB8DoV015773; Thu, 23 Jan 2014 22:08:18 +1100
Received: by river.localdomain (Postfix, from userid 1000)
	id 3BF7D20D87E9; Thu, 23 Jan 2014 22:08:10 +1100 (EST)
From: Stewart Smith <stewart@linux.vnet.ibm.com>
To: Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org
In-Reply-To: <52E0B4EC.4040904@weilnetz.de>
References: <1390452896-20146-1-git-send-email-stewart@linux.vnet.ibm.com>
	<52E0B4EC.4040904@weilnetz.de>
User-Agent: Notmuch/0.16 (http://notmuchmail.org) Emacs/24.3.1
	(x86_64-redhat-linux-gnu)
Date: Thu, 23 Jan 2014 22:08:10 +1100
Message-ID: <87eh3z552d.fsf@river.au.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 14012311-6102-0000-0000-000004D374E2
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 202.81.31.145
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] configure: helpfully output
	package names for some missing dependencies.
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
X-List-Received-Date: Thu, 23 Jan 2014 11:08:45 -0000

Stefan Weil <sw@weilnetz.de> writes:
> Am 23.01.2014 05:54, schrieb Stewart Smith:
>> diff --git a/configure b/configure
>> index 3782a6a..87303f6 100755
>> --- a/configure
>> +++ b/configure
>> @@ -1532,7 +1532,9 @@ EOF
>>          :
>>      else
>>          error_exit "zlib check failed" \
>> -            "Make sure to have the zlib libs and headers installed."
>> +            "Make sure to have the zlib libs and headers installed." \
>> +            "Debian/Ubuntu: zlib1g-dev" \
>> +            "Fedora/RHEL: zlib-devel"
>>      fi
>>  fi
>
> Removing that zlib check is on my private todo list since QEMU uses
> glib2, because glib2 already depends on zlib.

It may have some value existing as (at least on Fedora) glib2-devel
depends on libz.so.1 (i.e. zlib) but *not* on zlib-devel, so if we just
checked for glib2 we'd get the lib but not the headers for zlib, thus
having a failing build.

>> @@ -2656,6 +2662,8 @@ EOF
>>      # have neither and want - prompt for system/submodule install
>>      error_exit "DTC not present. Your options:" \
>>          "  (1) Preferred: Install the DTC devel package" \
>> +	"      Ubuntu/Debian: libfdt-dev" \
>
> The previous line uses a tab character. Replace it by blanks.

ack. Will do.

> Here a small hint might by useful because searching for 'DTC' packages
> will usually fail. What about writing "DTC (libfdt) devel package"?

ack, will do.

>> +        "      Fedora/RHEL: libfdt-devel" \
>>          "  (2) Fetch the DTC submodule, using:" \
>>          "      git submodule update --init dtc"
>>    else
>> 
>
> I'm not sure whether the file 'configure' is the right place for the
> precise package information. Here are some thoughts:

It's possibly not the ideal place, but I've never found an ideal
place. In other projects I've had the list of package names bitrot in:
- configure output
- README
- HACKING
- INSTALL
- some other documentation that ends up on a web site

Pretty much the only place it hasn't bitrotted is puppet manifests and
modules for setting up build machines... which isn't the *ideal* form of
documentation :)

That being said, I've found the package names outputted by configure to
be useful, even if not always perfect.

> * Those help messages are only useful for Debian / Fedore based Linux
>   distributions, but not for OpenSuSE and definitely not for other
>   hosts (Mac OS X, Windows, BSD).

My guess is that for OSX, Windows and BSD the git submodule option may
be taken more often?

I'll happily add in the OpenSuSE packages.. I'm just a bit less
experienced with OpenSuSE (maybe it's time for a VM though).

> * They only cover a very limited set of packages. For a really useful
>   QEMU, lots of more packages are needed.

That was to be my next patch: fleshing out the list and thinking of
somewhere to put the optional package names so that they're easily
discoverable.

> * Package names are not really good interfaces because they tend to
>   change over time.

Yep, they do - but this is relatively rare, and usually it's a version
number bump, and the old name usually gives you something to search for
that only gives a couple of results (rather than dozens).

> My personal impression is that the current hints in configure are
> sufficient (with the one exception DTC) and that the QEMU wiki is a
> better place to document build dependencies for the different platforms.

I'd vote for and rather than or, simply because I'm not good enough to
read all the Wiki docs before typing "./configure && make" and I suspect
I'm not the only one in the world :)


