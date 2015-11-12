Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Zwrwx-0007Vz-9T
	for mharc-qemu-trivial@gnu.org; Thu, 12 Nov 2015 08:30:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34573)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1Zwrwu-0007Re-Ie
	for qemu-trivial@nongnu.org; Thu, 12 Nov 2015 08:30:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1Zwrwt-0000gQ-EW
	for qemu-trivial@nongnu.org; Thu, 12 Nov 2015 08:30:00 -0500
Received: from mx1.redhat.com ([209.132.183.28]:59622)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1Zwrwo-0000eV-QX; Thu, 12 Nov 2015 08:29:55 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id 8929319CBCE;
	Thu, 12 Nov 2015 13:29:54 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-69.ams2.redhat.com
	[10.36.116.69])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tACDTqvd002626
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Thu, 12 Nov 2015 08:29:54 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id A6F56303F90B; Thu, 12 Nov 2015 14:29:51 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Rodrigo Rebello <rprebello@gmail.com>
References: <1447275457-1415-1-git-send-email-rprebello@gmail.com>
	<8737wbvcc2.fsf@blackfin.pond.sub.org>
	<CABLs7GWt+NkzzKh1cq+vTNfwsoGf36hJ_dSRDpkM+==pyhiM=A@mail.gmail.com>
Date: Thu, 12 Nov 2015 14:29:51 +0100
In-Reply-To: <CABLs7GWt+NkzzKh1cq+vTNfwsoGf36hJ_dSRDpkM+==pyhiM=A@mail.gmail.com>
	(Rodrigo Rebello's message of "Thu, 12 Nov 2015 10:54:09 -0200")
Message-ID: <87bnazmjlc.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
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
X-List-Received-Date: Thu, 12 Nov 2015 13:30:01 -0000

Rodrigo Rebello <rprebello@gmail.com> writes:

> Markus,
>
> 2015-11-12 6:41 GMT-02:00 Markus Armbruster <armbru@redhat.com>:
>> Rodrigo Rebello <rprebello@gmail.com> writes:
>>
>>> The check for stack-protector support consisted in compiling and linking
>>> the test program below (output by function write_c_skeleton()) with the
>>> compiler flag -fstack-protector-strong first and then with
>>> -fstack-protector-all if the first one failed to work:
>>>
>>>   int main(void) { return 0; }
>>>
>>> This caused false positives when using certain toolchains in which the
>>> compiler accepted -fstack-protector-strong but no support was provided
>>> by the C library, since for this stack-protector variant the compiler
>>> emits canary code only for functions that meet specific conditions
>>> (local arrays, memory references to local variables, etc.) and the code
>>> fragment under test included none of them (hence no stack protection
>>> code generated, no link failure).
>>>
>>> This fix changes the test program used for -fstack-protector checks to
>>> include a function that meets conditions which cause the compiler to
>>> generate canary code in all variants.
>>>
>>> Signed-off-by: Rodrigo Rebello <rprebello@gmail.com>
>>> ---
>>>  configure | 18 ++++++++++++++++++
>>>  1 file changed, 18 insertions(+)
>>>
>>> diff --git a/configure b/configure
>>> index 46fd8bd..c3d9592 100755
>>> --- a/configure
>>> +++ b/configure
>>> @@ -1486,6 +1486,24 @@ for flag in $gcc_flags; do
>>>  done
>>>
>>>  if test "$stack_protector" != "no"; then
>>> +  cat > $TMPC << EOF
>>> +void foo(const char *c);
>>> +
>>> +void foo(const char *c)
>>> +{
>>> +    char arr[64], *p;
>>> +    for (p = arr; *c; c++, p++) {
>>> +        *p = *c;
>>> +    }
>>> +}
>>> +
>>> +int main(void)
>>> +{
>>> +    char c[] = "";
>>> +    foo(c);
>>
>> Why not simply foo("")?
>>
>> Could the optimizer optimize away the pattern that triggers the canary?
>>
>> To protect against that possibility, we could use
>>
>> int main(int argc, char *argv[])
>> {
>>     foo(argv[0]);
>> }
>>
>
> You're right, this can be made simpler and the version you suggested
> works as well (even if I force different optimization levels in
> QEMU_CFLAGS).
> In fact, I've come up with an even simpler version which does not
> involve a "foo" function:
>
> int main(int argc, char *argv[])
> {
>     char arr[64], *p = arr, *c = argv[0];
>     while (*c) {
>         *p++ = *c++;
>     }
>     return 0;
> }
>
> What do you think of this one?

There's the theoretical possibility that the compiler treats main()
specially.

But then there's also the even more theoretical possibility that the
compiler inlines foo() into main() at link time, throws away foo(), and
treats main() specially.

We can worry about theoretical possibilities all day long.  Instead,
please use your judgement to pick something that works now and looks
reasonably robust to you.

