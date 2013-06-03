Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UjZJt-0002jw-MK
	for mharc-qemu-trivial@gnu.org; Mon, 03 Jun 2013 14:17:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49898)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1UjZJo-0002hX-JB
	for qemu-trivial@nongnu.org; Mon, 03 Jun 2013 14:17:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1UjZJk-00026P-2B
	for qemu-trivial@nongnu.org; Mon, 03 Jun 2013 14:17:20 -0400
Received: from mx1.redhat.com ([209.132.183.28]:24808)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>)
	id 1UjZJj-00026H-QL; Mon, 03 Jun 2013 14:17:15 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r53IHEav002934
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 3 Jun 2013 14:17:14 -0400
Received: from lacos-laptop.usersys.redhat.com (vpn1-4-126.ams2.redhat.com
	[10.36.4.126])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r53IHCCr032677; Mon, 3 Jun 2013 14:17:13 -0400
Message-ID: <51ACDE38.6050708@redhat.com>
Date: Mon, 03 Jun 2013 20:19:36 +0200
From: Laszlo Ersek <lersek@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130513 Thunderbird/17.0.6
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>
References: <1370251243-20352-1-git-send-email-mjt@msgid.tls.msk.ru>
	<51AC8D38.90205@redhat.com> <51AC8F21.3070109@msgid.tls.msk.ru>
In-Reply-To: <51AC8F21.3070109@msgid.tls.msk.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Eric Blake <eblake@redhat.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH trivial] acpi: actually
 require either data= or file= for -acpitable
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
X-List-Received-Date: Mon, 03 Jun 2013 18:17:25 -0000

On 06/03/13 14:42, Michael Tokarev wrote:
> 03.06.2013 16:34, Eric Blake wrote:
>> On 06/03/2013 03:20 AM, Michael Tokarev wrote:
>>> Initially the code ensured that we have exactly one of data= or file= option for -acpitable.  But after some transformations, the condition becomes
>>>
>>> if (has_data == has_file) { error }
>>>
>>> to mean, probably, that both should not be set at the same time.  But this condition does not cover the case when neither is set, and we generate bogus acpi table in this case.
>>>
>>> Instead, check if sum of the two is exactly 1.
>>>
>>> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru> --- hw/acpi/core.c |    2 +- 1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/hw/acpi/core.c b/hw/acpi/core.c index 42eeace..2815d8c 100644 --- a/hw/acpi/core.c +++ b/hw/acpi/core.c @@ -249,7 +249,7 @@ void acpi_table_add(const QemuOpts *opts, Error **errp) if (err) { goto out; } -    if (hdrs->has_file == hdrs->has_data) {
>>
>> NACK.
>>
>> hdrs->has_file and hdrs->has_data are both bool.
> 
> Yup.
> 
>> Pre-patch, the table of possible combinations is:
>>
>> false == false => error message, zero given false == true => okay, exactly one given true == false => okay, exactly one given true == true => error message, two given
>>
>> which is already what you want.
> 
> Ok, you're right.  Thank you for spotting this!
> 
> This function has another error -- if the file specified
> (either for data= or file=) can't be read, it happily
> continues instead of erroring out.  _That_ is the bug
> I tried to hunt but catched something else entirely ;)
> 
> Will send a real fix later today... :)

Please CC me; IIRC I sought to test this code reasonably deeply when I
wrote / transformed it. I'm curious.

Thanks,
Laszlo

