Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eCT6D-00078o-04
	for mharc-qemu-trivial@gnu.org; Wed, 08 Nov 2017 11:21:09 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46472)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eCT68-000769-8Z
	for qemu-trivial@nongnu.org; Wed, 08 Nov 2017 11:21:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eCT62-0000LC-76
	for qemu-trivial@nongnu.org; Wed, 08 Nov 2017 11:21:04 -0500
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:50517)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eCT62-0000L0-1p; Wed, 08 Nov 2017 11:20:58 -0500
Received: by mail-qt0-x243.google.com with SMTP id d9so4002381qtd.7;
	Wed, 08 Nov 2017 08:20:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=JO2K1rvGIfhzpdKibID3gtmJI1fgfthJA9nBG6/0ncw=;
	b=ud2PljpPtlBcSj71cfKp4qT4b5jspk6Xuw+qIqn/8xpZSml60ZWdWezIMgMKeEyHJG
	h4kJjqqXii6bjHIIIV4AovVKYvJzDzyFW+G2EeQdRB9hNqvIltKalBwWO4eixPswT1/K
	Op2NtsabzVLiRscLNePcgdA1IqDcrqLRF0Own7uoy2LzgSISZlm/ebv4G24KbWQXWazy
	SPqsOHPtlcNLDrhEcDuRhb8R7k9Z7C9MsBrPD8hOkdSoQ9o6Pk6NVlFpyStVMKaqipjz
	IeNcYp1uFVmJQXBgZHPuhCN1kIVeadfwpjca96sATMMX4gGGQnfyycTrsoiVkxaZoQcS
	FtWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=JO2K1rvGIfhzpdKibID3gtmJI1fgfthJA9nBG6/0ncw=;
	b=I09z5FJ/wzVn0vDXhhhooQUGO2QRO0p3ENdA1MW91hnXu3nAryKiIowQv26LqMWMxv
	CcOoZ5T+6ZsV9PGG4lDaLRDqEJkOnzQG51XnVyBBkRIEiiqtLLIpTYkXp9odRtfSVuTd
	Vc79JCI+D/F8yfgwedEByFsBO3Xx8IvjfHVpJyhMazOoNwosHiF4Eud3DHUwt+fQoQ/E
	K/N54EkZeYUCkZHW46FlRpxo+3ykHoq2PHN3Q8kHS2wlQFnPvyZ/zxcQF+qe9oQ23Wnr
	TpDzreWyCHtmhXavzUovBg8KDgkCl6hRp+kx4oCRIQNxPaFkvyNO30szuQJL56ZrmAWR
	ZX0A==
X-Gm-Message-State: AJaThX7gJXlnYoWckCCmwLW8U2odaI0JvWZGXnMRQFMJNVcJFVXpp8ql
	yda6T/8MF3MChqX4I5gRREY=
X-Google-Smtp-Source: ABhQp+RmYA4rwO2Fqm1+RAsvc1HLCC41kuIA4GjrPqT3243G184/bqiChgXD9vmJE4sW8xMlw9k4gA==
X-Received: by 10.237.42.131 with SMTP id t3mr1683267qtd.188.1510158057361;
	Wed, 08 Nov 2017 08:20:57 -0800 (PST)
Received: from [192.168.1.240] ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id
	h187sm2929084qkc.40.2017.11.08.08.20.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 Nov 2017 08:20:56 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
	Peter Xu <peterx@redhat.com>, Markus Armbruster <armbru@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org, "Emilio G . Cota" <cota@braap.org>,
	Eric Blake <eblake@redhat.com>, Richard Henderson <rth@twiddle.net>
References: <20171030181459.1951-1-f4bug@amsat.org>
	<20171103003520.GF3111@localhost.localdomain>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <9adefce7-1c65-9539-1961-fa981f0ecccc@amsat.org>
Date: Wed, 8 Nov 2017 13:20:49 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <20171103003520.GF3111@localhost.localdomain>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: Re: [Qemu-trivial] [RFC PATCH] vl: only display available
 accelerators
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 08 Nov 2017 16:21:08 -0000

On 11/02/2017 09:35 PM, Eduardo Habkost wrote:
> On Mon, Oct 30, 2017 at 03:14:59PM -0300, Philippe Mathieu-Daudé wrote:
>> examples configuring with '--enable-kvm --disable-tcg'
>>
>> - before
>>
>>   $ qemu-system-x86_64 -accel help
>>   Possible accelerators: kvm, xen, hax, tcg
>>
>>   $ qemu-system-x86_64 -accel tcg
>>   qemu-system-x86_64: -machine accel=tcg: No accelerator found
>>
>>   # qemu-system-x86_64 -accel hax
>>   qemu-system-x86_64: -machine accel=hax: No accelerator found
>>
>> - after
>>
>>   $ qemu-system-x86_64 -accel help
>>   Possible accelerators:
>>     xen
>>     kvm
>>
>> Suggested-by: Eduardo Habkost <ehabkost@redhat.com>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>> since RFC:
>>   - use much cleaner object_class_get_list(TYPE_ACCEL, false)
>>
>>  vl.c | 39 ++++++++++++++++++++++++++++++++++-----
>>  1 file changed, 34 insertions(+), 5 deletions(-)
>>
>> diff --git a/vl.c b/vl.c
>> index ec299099ff..0f13641715 100644
>> --- a/vl.c
>> +++ b/vl.c
>> @@ -2764,6 +2764,39 @@ static gint machine_class_cmp(gconstpointer a, gconstpointer b)
>>      exit(!name || !is_help_option(name));
>>  }
>>  
>> +static void accel_list_entry(gpointer data, gpointer user_data)
>> +{
>> +    ObjectClass *oc = data;
>> +    const char *typename = object_class_get_name(oc);
>> +    int len;
>> +
>> +    if (!qtest_driver() && !g_strcmp0(typename, ACCEL_CLASS_NAME("qtest"))) {
>> +        return; /* used by test cases */
>> +    }
> 
> I would prefer to not hardcode the accel name here.  If you want
> qtest to have special behavior, you can add a new field to
> AccelClass to implement that.
> 
> However, I don't think I agree we should hide qtest from the
> user: it is accepted on the command-line, so why should we lie?

Ok.

> Why not add a description field and indicate that qtest is useful
> only for testing?

This is cleaner indeed.

>> +
>> +    len = strlen(typename) - strlen("-" TYPE_ACCEL);
> 
> You can use AccelClass::name here.

Hmm yes but currently this is not what the user should use, since the
accel_find() matches the ACCEL_CLASS_NAME:

$ ppc64-softmmu/qemu-system-ppc64 -accel QTest
qemu-system-ppc64: -machine accel=QTest: No accelerator found

I'll respin but the change will be bigger so I is probably too late for
2.11.

> 
>> +    if (len > 0) {
>> +        error_printf("  %.*s\n", len, typename);
>> +    }
>> +}
>> +
>> +static void accel_parse(const char *name, QemuOpts *accel_opts)
>> +{
>> +    const char *optarg = qemu_opt_get(accel_opts, "accel");
>> +    GSList *list;
>> +
>> +    if (!is_help_option(optarg)) {
>> +        return;
>> +    }
>> +
>> +    list = object_class_get_list(TYPE_ACCEL, false);
>> +    error_printf("Possible accelerators:\n");
>> +    g_slist_foreach(list, accel_list_entry, NULL);
>> +    g_slist_free(list);
>> +
>> +    exit(0);
>> +}
>> +
>>  void qemu_add_exit_notifier(Notifier *notify)
>>  {
>>      notifier_list_add(&exit_notifiers, notify);
>> @@ -3881,11 +3914,7 @@ int main(int argc, char **argv, char **envp)
>>              case QEMU_OPTION_accel:
>>                  accel_opts = qemu_opts_parse_noisily(qemu_find_opts("accel"),
>>                                                       optarg, true);
>> -                optarg = qemu_opt_get(accel_opts, "accel");
>> -                if (!optarg || is_help_option(optarg)) {
>> -                    error_printf("Possible accelerators: kvm, xen, hax, tcg\n");
>> -                    exit(0);
>> -                }
>> +                accel_parse(optarg, accel_opts);
>>                  opts = qemu_opts_create(qemu_find_opts("machine"), NULL,
>>                                          false, &error_abort);
>>                  qemu_opt_set(opts, "accel", optarg, &error_abort);
>> -- 
>> 2.15.0.rc2
>>
> 

