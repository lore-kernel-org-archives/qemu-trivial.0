Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UfABl-0004wK-8p
	for mharc-qemu-trivial@gnu.org; Wed, 22 May 2013 10:38:49 -0400
Received: from eggs.gnu.org ([208.118.235.92]:43955)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1UfABh-0004qr-Mf
	for qemu-trivial@nongnu.org; Wed, 22 May 2013 10:38:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1UfABg-0003G6-Fi
	for qemu-trivial@nongnu.org; Wed, 22 May 2013 10:38:45 -0400
Received: from mx1.redhat.com ([209.132.183.28]:29704)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1UfABc-0003F6-JQ; Wed, 22 May 2013 10:38:40 -0400
Received: from int-mx12.intmail.prod.int.phx2.redhat.com
	(int-mx12.intmail.prod.int.phx2.redhat.com [10.5.11.25])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r4MEcbkd002131
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Wed, 22 May 2013 10:38:37 -0400
Received: from yakj.usersys.redhat.com (ovpn-112-39.ams2.redhat.com
	[10.36.112.39])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r4MEcWSc018814; Wed, 22 May 2013 10:38:33 -0400
Message-ID: <519CD863.3080205@redhat.com>
Date: Wed, 22 May 2013 16:38:27 +0200
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: Anthony Liguori <aliguori@us.ibm.com>
References: <1369066884-431-1-git-send-email-peter.maydell@linaro.org>
	<519A50EE.8040804@redhat.com> <871u8zp34w.fsf@codemonkey.ws>
	<CAFEAcA90AJyBNtNxRa45y3zfWCj8tAq5jsqoDLmDTAZT0DK=2g@mail.gmail.com>
	<87y5b7hyuo.fsf@codemonkey.ws>
In-Reply-To: <87y5b7hyuo.fsf@codemonkey.ws>
X-Enigmail-Version: 1.5.1
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.25
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: Peter Maydell <peter.maydell@linaro.org>,
	John Rigby <john.rigby@linaro.org>, patches@linaro.org,
	qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	Libvirt <libvir-list@redhat.com>,
	=?ISO-8859-1?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qapi-schema.json: Reformat
 TargetType enum to one-per-line
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
X-List-Received-Date: Wed, 22 May 2013 14:38:47 -0000

Il 22/05/2013 16:29, Anthony Liguori ha scritto:
> Peter Maydell <peter.maydell@linaro.org> writes:
> 
>> On 22 May 2013 14:15, Anthony Liguori <aliguori@us.ibm.com> wrote:
>>> Paolo Bonzini <pbonzini@redhat.com> writes:
>>>> You
>>>> don't need to know what targets were supported in the version that you
>>>> compiled from.  Only one target is supported in this executable
>>>> anyway.
>>>
>>> It seems useful to me.  One day we may support multiple targets per
>>> executable.
>>
>> Why would you care about which architectures the executable supports?
>> What you actually want to know is which machine models are supported;
>> whether board foo happens to be ARM or PPC isn't really very interesting
>> IMHO.
> 
> That's a very good point.  It was the libvirt folks that requested
> this.  Perhaps they can shed some light on the logic?

There is processor-dependent logic in libvirt, for example the CPUID bits.

Paolo


