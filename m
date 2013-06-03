Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UjU5q-0004oG-Dw
	for mharc-qemu-trivial@gnu.org; Mon, 03 Jun 2013 08:42:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56990)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UjU5k-0004gx-By
	for qemu-trivial@nongnu.org; Mon, 03 Jun 2013 08:42:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UjU5f-0008IR-EB
	for qemu-trivial@nongnu.org; Mon, 03 Jun 2013 08:42:28 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:34947)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1UjU5U-0008Fi-RA; Mon, 03 Jun 2013 08:42:12 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 34E5A4063B;
	Mon,  3 Jun 2013 16:42:10 +0400 (MSK)
Received: from wh.tls.msk.ru (wh.tls.msk.ru [192.168.177.7])
	by tsrv.corpit.ru (Postfix) with ESMTP id 22C5C48B;
	Mon,  3 Jun 2013 16:42:10 +0400 (MSK)
Message-ID: <51AC8F21.3070109@msgid.tls.msk.ru>
Date: Mon, 03 Jun 2013 16:42:09 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:10.0.12) Gecko/20130116 Icedove/10.0.12
MIME-Version: 1.0
To: Eric Blake <eblake@redhat.com>
References: <1370251243-20352-1-git-send-email-mjt@msgid.tls.msk.ru>
	<51AC8D38.90205@redhat.com>
In-Reply-To: <51AC8D38.90205@redhat.com>
X-Enigmail-Version: 1.4.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
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
X-List-Received-Date: Mon, 03 Jun 2013 12:42:33 -0000

03.06.2013 16:34, Eric Blake wrote:
> On 06/03/2013 03:20 AM, Michael Tokarev wrote:
>> Initially the code ensured that we have exactly one of data= or file= option for -acpitable.  But after some transformations, the condition becomes
>> 
>> if (has_data == has_file) { error }
>> 
>> to mean, probably, that both should not be set at the same time.  But this condition does not cover the case when neither is set, and we generate bogus acpi table in this case.
>> 
>> Instead, check if sum of the two is exactly 1.
>> 
>> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru> --- hw/acpi/core.c |    2 +- 1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> diff --git a/hw/acpi/core.c b/hw/acpi/core.c index 42eeace..2815d8c 100644 --- a/hw/acpi/core.c +++ b/hw/acpi/core.c @@ -249,7 +249,7 @@ void acpi_table_add(const QemuOpts *opts, Error **errp) if (err) { goto out; } -    if (hdrs->has_file == hdrs->has_data) {
> 
> NACK.
> 
> hdrs->has_file and hdrs->has_data are both bool.

Yup.

> Pre-patch, the table of possible combinations is:
> 
> false == false => error message, zero given false == true => okay, exactly one given true == false => okay, exactly one given true == true => error message, two given
> 
> which is already what you want.

Ok, you're right.  Thank you for spotting this!

This function has another error -- if the file specified
(either for data= or file=) can't be read, it happily
continues instead of erroring out.  _That_ is the bug
I tried to hunt but catched something else entirely ;)

Will send a real fix later today... :)

Thanks,

/mjt

