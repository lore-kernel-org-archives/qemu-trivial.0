Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1U38RQ-00071g-4n
	for mharc-qemu-trivial@gnu.org; Wed, 06 Feb 2013 12:05:48 -0500
Received: from eggs.gnu.org ([208.118.235.92]:48543)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1U38RI-00070w-2h
	for qemu-trivial@nongnu.org; Wed, 06 Feb 2013 12:05:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1U38RD-0002yr-65
	for qemu-trivial@nongnu.org; Wed, 06 Feb 2013 12:05:39 -0500
Received: from mail-ve0-f178.google.com ([209.85.128.178]:64255)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>)
	id 1U38RD-0002xf-0K; Wed, 06 Feb 2013 12:05:35 -0500
Received: by mail-ve0-f178.google.com with SMTP id db10so1411368veb.9
	for <multiple recipients>; Wed, 06 Feb 2013 09:05:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=2oOaCY8Der6mysHZaByGA7cbQf6B0YSS5Sgei6DanZI=;
	b=z7mWH7iQ+VVIvNkn6cVZsI56Q4LVCKmrcwsJWS2NvoMpHbbXB/Q0GwvZmTrducRHga
	GdGUHo0YB7EwgKsMw/AR6cLRlxR8E/KdbFqdUEarwFu5QN2wkCy3XG4aDSbIEJspnzEY
	nxlHQZ1TQcquDnNeq/yPN2UWvTRlLbx5/kliLT3hArhgzVD6ezFEQPIUeBdVQQblnuAe
	UxkycqeH3WVS/SfxyQUzZiA3/bJKBZPUmAUnk28JGUbDBVEBC92hA/PjN1/osU4h2ar8
	Ze3vD33/Zabok8IhujVxzTC+NcHwmgOk2Sr39l2UrEEAt8/oiTTNuNbdetK4CsiMkWMK
	IkXA==
X-Received: by 10.221.10.72 with SMTP id oz8mr33758548vcb.36.1360170328161;
	Wed, 06 Feb 2013 09:05:28 -0800 (PST)
Received: from pebble.twiddle.net ([173.247.199.130])
	by mx.google.com with ESMTPS id q5sm3522923vdj.5.2013.02.06.09.05.25
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Wed, 06 Feb 2013 09:05:27 -0800 (PST)
Sender: Richard Henderson <rth7680@gmail.com>
Message-ID: <51128D53.7060303@twiddle.net>
Date: Wed, 06 Feb 2013 09:05:23 -0800
From: Richard Henderson <rth@twiddle.net>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130110 Thunderbird/17.0.2
MIME-Version: 1.0
To: Stefan Hajnoczi <stefanha@gmail.com>
References: <9021f2f9e51e4c7a253d1993ea05f87d0718752f.1359627279.git.mprivozn@redhat.com>
	<510B90C9.8000309@suse.de> <510BDCBF.5040108@redhat.com>
	<20130206144956.GA22233@stefanha-thinkpad.redhat.com>
In-Reply-To: <20130206144956.GA22233@stefanha-thinkpad.redhat.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.128.178
Cc: qemu-trivial@nongnu.org, Michal Privoznik <mprivozn@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?ISO-8859-1?Q?Andreas_F=E4?= =?ISO-8859-1?Q?rber?= <afaerber@suse.de>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] configure: Undefine
 _FORTIFY_SOURCE prior using it
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
X-List-Received-Date: Wed, 06 Feb 2013 17:05:47 -0000

On 2013-02-06 06:49, Stefan Hajnoczi wrote:
>> $ echo "int main() {return 0;}" | gcc -D_FORTIFY_SOURCE=2 -x c -
>> <command-line>:0:0: warning: "_FORTIFY_SOURCE" redefined [enabled by default]
>> <stdin>:1:0: note: this is the location of the previous definition
>>
>> in which case we must undefine it. However, if the _FORTIFY_SOURCE is
>> defined by environment, I think we should not override it. So maybe need
>> a different approach. Anyway, with current state I cannot compile. I am using
>> gcc version 4.7.2 (Gentoo 4.7.2 p1.3, pie-0.5.5)
>
> It would be nice to fix this for QEMU 1.4 but my gcc FORTIFY_SOURCE foo
> is not strong enough to know what the best approach is here.

Using -U -D is just fine to override something that the distro turned on 
by default.


r~


