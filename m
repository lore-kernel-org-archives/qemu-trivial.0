Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SSnkl-0002jI-MH
	for mharc-qemu-trivial@gnu.org; Fri, 11 May 2012 07:11:19 -0400
Received: from eggs.gnu.org ([208.118.235.92]:53163)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1SSnkh-0002WB-MQ
	for qemu-trivial@nongnu.org; Fri, 11 May 2012 07:11:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1SSnkb-0000fC-H9
	for qemu-trivial@nongnu.org; Fri, 11 May 2012 07:11:15 -0400
Received: from cantor2.suse.de ([195.135.220.15]:53126 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1SSnkN-0000cS-QT; Fri, 11 May 2012 07:10:55 -0400
Received: from relay1.suse.de (unknown [195.135.220.254])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx2.suse.de (Postfix) with ESMTP id C21C08FA98;
	Fri, 11 May 2012 13:10:53 +0200 (CEST)
Message-ID: <4FACF3BA.7070403@suse.de>
Date: Fri, 11 May 2012 13:10:50 +0200
From: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120421 Thunderbird/12.0
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>
References: <1336218047-8906-1-git-send-email-afaerber@suse.de>
	<4FA636A0.2060803@weilnetz.de>
In-Reply-To: <4FA636A0.2060803@weilnetz.de>
X-Enigmail-Version: 1.5pre
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4-2.6
X-Received-From: 195.135.220.15
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH for-1.1] target-mips: Remove
 commented-out function declaration
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
X-List-Received-Date: Fri, 11 May 2012 11:11:18 -0000

Am 06.05.2012 10:30, schrieb Stefan Weil:
> Am 05.05.2012 13:40, schrieb Andreas F=C3=A4rber:
>> There is no function cpu_mips_get_clock(), so drop it.
>>
>> Signed-off-by: Andreas F=C3=A4rber<afaerber@suse.de>
>> Cc: Stefan Weil<sw@weilnetz.de>
>> ---
>>   target-mips/cpu.h |    1 -
>>   1 files changed, 0 insertions(+), 1 deletions(-)
>>
>> diff --git a/target-mips/cpu.h b/target-mips/cpu.h
>> index c0f8826..44c1152 100644
>> --- a/target-mips/cpu.h
>> +++ b/target-mips/cpu.h
>> @@ -627,7 +627,6 @@ enum {
>>
>>   int cpu_mips_exec(CPUMIPSState *s);
>>   CPUMIPSState *cpu_mips_init(const char *cpu_model);
>> -//~ uint32_t cpu_mips_get_clock (void);
>>   int cpu_mips_signal_handler(int host_signum, void *pinfo, void *puc)=
;
>>
>>   /* mips_timer.c */
>=20
> Acked-by: Stefan Weil <sw@weilnetz.de>

Thanks, applied to qom-next for now:
http://repo.or.cz/w/qemu/afaerber.git/shortlog/refs/heads/qom-next

I'll queue it for a 1.1-rc2 pull.

Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=C3=B6rffer; HRB 16746 AG N=C3=BC=
rnberg

