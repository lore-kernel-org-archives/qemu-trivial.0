Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZwrOK-0007Xh-6x
	for mharc-qemu-trivial@gnu.org; Thu, 12 Nov 2015 07:54:16 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53016)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rprebello@gmail.com>) id 1ZwrOH-0007Tp-DY
	for qemu-trivial@nongnu.org; Thu, 12 Nov 2015 07:54:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rprebello@gmail.com>) id 1ZwrOG-0007zq-AU
	for qemu-trivial@nongnu.org; Thu, 12 Nov 2015 07:54:13 -0500
Received: from mail-ob0-x230.google.com ([2607:f8b0:4003:c01::230]:36789)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rprebello@gmail.com>)
	id 1ZwrOE-0007zW-4l; Thu, 12 Nov 2015 07:54:10 -0500
Received: by obdgf3 with SMTP id gf3so45650583obd.3;
	Thu, 12 Nov 2015 04:54:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=fwRnZxiUP0n3L41KSRLXusvlu3k91yB4pxVcqBu/gqM=;
	b=ClGCovGC/H+usoWSbyf3klr2t5/cPk/lcJj2AfAC6Se5adNYf9xKQzZA+hf1EN1kus
	zh2FIWJd6qJpfbdXwU2CsShuy1ZSwP/7U2cxI4nFqCDbj6bfkJbReGlyj3EjVYZSSXF+
	wuZMSlymjfXdKontrTDXxZIGt0UAU9CE7VkgHRy3ZCa7WaPJ7VQPcF4BbjIytL1MbTiQ
	yuzZmVeeqXz1YeKr51FXaxDz2VuULM4f0POsrR9TurOFvudDWeUFYTF0ewQKioIysuSW
	2qUx742MzpGwRFtvQqe2A2VuyqbRaBA+525IwYkuevMjd76qn8G6prfHCxfPXrwdzTyw
	hZ3g==
MIME-Version: 1.0
X-Received: by 10.60.33.232 with SMTP id u8mr8514739oei.22.1447332849650; Thu,
	12 Nov 2015 04:54:09 -0800 (PST)
Received: by 10.76.99.142 with HTTP; Thu, 12 Nov 2015 04:54:09 -0800 (PST)
In-Reply-To: <8737wbvcc2.fsf@blackfin.pond.sub.org>
References: <1447275457-1415-1-git-send-email-rprebello@gmail.com>
	<8737wbvcc2.fsf@blackfin.pond.sub.org>
Date: Thu, 12 Nov 2015 10:54:09 -0200
Message-ID: <CABLs7GWt+NkzzKh1cq+vTNfwsoGf36hJ_dSRDpkM+==pyhiM=A@mail.gmail.com>
From: Rodrigo Rebello <rprebello@gmail.com>
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:4003:c01::230
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/1] configure: use
 appropriate code fragment for -fstack-protector checks
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
X-List-Received-Date: Thu, 12 Nov 2015 12:54:14 -0000

Markus,

2015-11-12 6:41 GMT-02:00 Markus Armbruster <armbru@redhat.com>:
> Rodrigo Rebello <rprebello@gmail.com> writes:
>
>> The check for stack-protector support consisted in compiling and linking
>> the test program below (output by function write_c_skeleton()) with the
>> compiler flag -fstack-protector-strong first and then with
>> -fstack-protector-all if the first one failed to work:
>>
>>   int main(void) { return 0; }
>>
>> This caused false positives when using certain toolchains in which the
>> compiler accepted -fstack-protector-strong but no support was provided
>> by the C library, since for this stack-protector variant the compiler
>> emits canary code only for functions that meet specific conditions
>> (local arrays, memory references to local variables, etc.) and the code
>> fragment under test included none of them (hence no stack protection
>> code generated, no link failure).
>>
>> This fix changes the test program used for -fstack-protector checks to
>> include a function that meets conditions which cause the compiler to
>> generate canary code in all variants.
>>
>> Signed-off-by: Rodrigo Rebello <rprebello@gmail.com>
>> ---
>>  configure | 18 ++++++++++++++++++
>>  1 file changed, 18 insertions(+)
>>
>> diff --git a/configure b/configure
>> index 46fd8bd..c3d9592 100755
>> --- a/configure
>> +++ b/configure
>> @@ -1486,6 +1486,24 @@ for flag in $gcc_flags; do
>>  done
>>
>>  if test "$stack_protector" != "no"; then
>> +  cat > $TMPC << EOF
>> +void foo(const char *c);
>> +
>> +void foo(const char *c)
>> +{
>> +    char arr[64], *p;
>> +    for (p = arr; *c; c++, p++) {
>> +        *p = *c;
>> +    }
>> +}
>> +
>> +int main(void)
>> +{
>> +    char c[] = "";
>> +    foo(c);
>
> Why not simply foo("")?
>
> Could the optimizer optimize away the pattern that triggers the canary?
>
> To protect against that possibility, we could use
>
> int main(int argc, char *argv[])
> {
>     foo(argv[0]);
> }
>

You're right, this can be made simpler and the version you suggested
works as well (even if I force different optimization levels in
QEMU_CFLAGS).
In fact, I've come up with an even simpler version which does not
involve a "foo" function:

int main(int argc, char *argv[])
{
    char arr[64], *p = arr, *c = argv[0];
    while (*c) {
        *p++ = *c++;
    }
    return 0;
}

What do you think of this one?

Regards,
Rodrigo

>> +    return 0;
>> +}
>> +EOF
>>    gcc_flags="-fstack-protector-strong -fstack-protector-all"
>>    sp_on=0
>>    for flag in $gcc_flags; do

