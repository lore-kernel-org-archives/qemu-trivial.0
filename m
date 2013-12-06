Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Vp2GA-0004GF-M0
	for mharc-qemu-trivial@gnu.org; Fri, 06 Dec 2013 15:44:26 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37431)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1Vp2G3-00047A-Ri
	for qemu-trivial@nongnu.org; Fri, 06 Dec 2013 15:44:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1Vp2Fx-0006pM-S5
	for qemu-trivial@nongnu.org; Fri, 06 Dec 2013 15:44:19 -0500
Received: from mail-ea0-x230.google.com ([2a00:1450:4013:c01::230]:52708)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1Vp2Fx-0006pG-Ky; Fri, 06 Dec 2013 15:44:13 -0500
Received: by mail-ea0-f176.google.com with SMTP id h14so511024eaj.21
	for <multiple recipients>; Fri, 06 Dec 2013 12:44:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=XDLCg5EhCfCk58IgNUkAH3OnhQ1zmt20bdvH42QvB+k=;
	b=kksWzy46wiinwQnZ5/xUpMHJvWwND6MXQPzQcEn6hy0C/Fdfw+ppJ8NmvsOwOTarZ5
	kUp3S5hXoJZHrM7TfQQb6zXDMmkqbZUJ/3mNy6Bn0wMVUREIVOeDWrtBPa46bBTElNmt
	vxp869JExYFCJMsZSNZ4UtU4IhkWpa/AjjNWpfrXL2f/iRMrqRPNEeruPA5GlZKVnIlo
	tVHVgUK65YQ8F+ccFYS8VSrK9TXnZciMJ6NtIhTgZW4Y+ZjY4Lh8i+/bEDnWGXJkbPs7
	uFD8slhau3FKesvT+lg413w6ugOun+f7l6/MiS49j4OhMi41dhwRHfhpTfdRFrA0Oq6x
	zCjg==
X-Received: by 10.14.3.130 with SMTP id 2mr3982189eeh.36.1386362652088;
	Fri, 06 Dec 2013 12:44:12 -0800 (PST)
Received: from yakj.usersys.redhat.com (net-2-35-202-54.cust.dsl.vodafone.it.
	[2.35.202.54]) by mx.google.com with ESMTPSA id
	n1sm121503364eep.20.2013.12.06.12.44.09 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 06 Dec 2013 12:44:10 -0800 (PST)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <52A23715.7000701@redhat.com>
Date: Fri, 06 Dec 2013 21:44:05 +0100
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130923 Thunderbird/17.0.9
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>
References: <1386342485-8656-1-git-send-email-pbonzini@redhat.com>
	<52A21FD5.6080101@msgid.tls.msk.ru>
In-Reply-To: <52A21FD5.6080101@msgid.tls.msk.ru>
X-Enigmail-Version: 1.6
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4013:c01::230
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, qemu-stable@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] help: add id suboption to -iscsi
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
X-List-Received-Date: Fri, 06 Dec 2013 20:44:26 -0000

Il 06/12/2013 20:04, Michael Tokarev ha scritto:
> 06.12.2013 19:08, Paolo Bonzini wrote:
>> --- a/qemu-options.hx
>> +++ b/qemu-options.hx
>> @@ -2089,7 +2089,7 @@ ETEXI
>>  DEF("iscsi", HAS_ARG, QEMU_OPTION_iscsi,
>>      "-iscsi [user=user][,password=password]\n"
>>      "       [,header-digest=CRC32C|CR32C-NONE|NONE-CRC32C|NONE\n"
>> -    "       [,initiator-name=iqn]\n"
>> +    "       [,initiator-name=initiator-iqn][,id=target-iqn]\n"
>>      "                iSCSI session parameters\n", QEMU_ARCH_ALL)
>>  STEXI
> 
> I'm not sure this is clearer, to me it looks more confusing
> than before.
> 
> The thing is that "id" suboption is automatic and is handled
> in the option parsing code explicitly.

But it has a particular meaning in the case of -iscsi.  Usually it is
referred to in other options, or by monitor commands.  For -iscsi, it is
the target IQN.

Also, it is documented in qemu-doc.texi (albeit in -readconfig format):

Setting the target name allows different options for different targets
@example
[iscsi "iqn.target.name"]
  user = "CHAP username"
  password = "CHAP password"
  initiator-name = "iqn.qemu.test:my-initiator"
  # header digest is one of CRC32C|CRC32C-NONE|NONE-CRC32C|NONE
  header-digest = "CRC32C"
@end example


> As far as I can see, "id" suboption is actually never used by
> iscsi code, only initiator-name is.

It's used:

    list = qemu_find_opts("iscsi");
    if (list) {
        opts = qemu_opts_find(list, target);
        if (!opts) {
            opts = QTAILQ_FIRST(&list->head);
        }
        if (opts) {
            name = qemu_opt_get(opts, "initiator-name");
            if (name) {
                return g_strdup(name);
            }
        }
    }

qemu_opts_find(list, target) returns the option set whose id is equal to
target.

> What this change is for?

Better documentation. :)

Paolo

