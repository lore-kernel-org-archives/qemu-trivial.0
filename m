Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZZJ0K-0008Qa-SF
	for mharc-qemu-trivial@gnu.org; Tue, 08 Sep 2015 09:32:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50015)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcel.apfelbaum@gmail.com>) id 1ZZJ0B-0008Gf-4f
	for qemu-trivial@nongnu.org; Tue, 08 Sep 2015 09:32:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcel.apfelbaum@gmail.com>) id 1ZZJ09-0001bM-Lw
	for qemu-trivial@nongnu.org; Tue, 08 Sep 2015 09:31:59 -0400
Received: from mail-wi0-x234.google.com ([2a00:1450:400c:c05::234]:37225)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcel.apfelbaum@gmail.com>)
	id 1ZZJ00-0001Vq-HH; Tue, 08 Sep 2015 09:31:48 -0400
Received: by wicfx3 with SMTP id fx3so115268370wic.0;
	Tue, 08 Sep 2015 06:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=reply-to:subject:references:to:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=jWp6JsydOHKqS6As4S9KCXThsQBaICielcU0+ROS2Co=;
	b=Bs7z/TGjljAvebsw+ACJ3LazT8Vb+QqoEaXHqhtzjKjspK8wp60JleQ1aquOpdTAzt
	1DOY4OXorYewZJSXP8fiFpB4nCukvt5MDYGBuT9W0u8aVTqdOfEKG4woH1m52QBtCrMC
	57H9z0uxZENyTKk3raRjgfneVZT9b/pEOAFazFavSNb2au0vt+Cjgri1Lg8Le34TDDTG
	RrMkPA8Rm75SGDag5XacEJX9oOu8ILZuBZu6UenbhHQi2VqxWZ23IdoZHLThny8/uM/W
	/YQuoHEGLoNWDeER5LPdm6EWekANlx5RpmpUSrqW6Mu32dbbuDeOCGpe6Lpnk/FHp9Ro
	Piew==
X-Received: by 10.194.86.134 with SMTP id p6mr49357429wjz.71.1441719107297;
	Tue, 08 Sep 2015 06:31:47 -0700 (PDT)
Received: from [192.168.1.115] ([46.120.6.143])
	by smtp.googlemail.com with ESMTPSA id
	s9sm4905848wjy.16.2015.09.08.06.31.45
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 08 Sep 2015 06:31:46 -0700 (PDT)
References: <1441621264-23812-1-git-send-email-pbonzini@redhat.com>
	<87h9n5p3ou.fsf@blackfin.pond.sub.org>
To: Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
From: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Message-ID: <55EEE340.10607@gmail.com>
Date: Tue, 8 Sep 2015 16:31:44 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <87h9n5p3ou.fsf@blackfin.pond.sub.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c05::234
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] add macro file for
 coccinelle
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
Reply-To: marcel@redhat.com
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 08 Sep 2015 13:32:05 -0000

On 09/08/2015 02:10 PM, Markus Armbruster wrote:
> Paolo Bonzini <pbonzini@redhat.com> writes:
>
>> Coccinelle chokes on some idioms from compiler.h and queue.h.
>> Extract those in a macro file, to be used with "--macro-file
>> scripts/cocci-macro-file.h".
>>
>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>
> I tested this as follows.  Coccinelle can report on its parsing
> difficulties:
>
> $ spatch --parse-c `git-ls-files | grep '\.c$'
>
> Requires a generous ulimit -s, and produces tons of output.  The
> interesting part here is the summary at the end:
>
>      NB total files = 1923; perfect = 1377; pbs = 545; timeout = 0; =========> 71%
>      nb good = 964472,  nb passed = 14824 =========> 1.48% passed
>      nb good = 964472,  nb bad = 23759 =========> 97.63% good or passed
>
>
> Repeat with --macro-file scripts/cocci-macro-file.h.
>
>      NB total files = 1923; perfect = 1463; pbs = 459; timeout = 0; =========> 76%
>      nb good = 910559,  nb passed = 15352 =========> 1.53% passed
>      nb good = 910559,  nb bad = 77610 =========> 92.27% good or passed
>
> The first line shows clear improvement: 86 more files are now deemed
> "perfect".  I'm not sure how to read the remaining two lines.
>
> Also interesting are the "maybe 10 most problematic tokens".  Before:
>
>      -----------------------------------------------------------------------
>      maybe 10 most problematic tokens
>      -----------------------------------------------------------------------
>      glue: present in 620 parsing errors
>      example:
>
>             #define OP_32_64(x)                             \
>                     glue(glue(case INDEX_op_, x), _i32):    \
>                     glue(glue(case INDEX_op_, x), _i64)
>      NULL: present in 507 parsing errors
>      example:
>                 vs->dev = (QVirtioDevice *)dev;
>                 g_assert(dev != NULL);
>                 g_assert_cmphex(vs->dev->device_type, ==, QVIRTIO_SCSI_DEVICE_ID);
>
>      VMStateField: present in 502 parsing errors
>      example:
>                 .version_id = 1,
>                 .minimum_version_id = 1,
>                 .fields = (VMStateField[]) {
>                     VMSTATE_VBUFFER_UINT32(data, Fifo8, 1, NULL, 0, capacity),

Hi Markus,

I talked to coccinelle maintainer some time ago about
the above C construct (fields = (VMStateField[]) {)
and sadly is not yet supported by the C parser.

If we want this we need to do it by ourselves :(

Thanks,
Marcel


>      fields: present in 502 parsing errors
>      example:
>                 .version_id = 1,
>                 .minimum_version_id = 1,
>                 .fields = (VMStateField[]) {
>                     VMSTATE_VBUFFER_UINT32(data, Fifo8, 1, NULL, 0, capacity),
>      minimum_version_id: present in 433 parsing errors
>      example:
>                 .version_id = 1,
>                 .minimum_version_id = 1,
>                 .fields = (VMStateField[]) {
>                     VMSTATE_VBUFFER_UINT32(data, Fifo8, 1, NULL, 0, capacity),
>      uint32_t: present in 414 parsing errors
>      example:
>                                         uint32_t *bg, uint32_t *fg,                 \
>                                         VncPalette **palette) {                     \
>                     uint##bpp##_t *data;                                            \
>                     uint##bpp##_t c0, c1, ci;                                       \
>      env: present in 400 parsing errors
>      example:
>                 int v = float32_compare_quiet(a, b, &env->fp_status);
>                 set_br(env, v != float_relation_greater, br);
>             }
>      version_id: present in 308 parsing errors
>      example:
>                 .version_id = 1,
>                 .minimum_version_id = 1,
>                 .fields = (VMStateField[]) {
>                     VMSTATE_VBUFFER_UINT32(data, Fifo8, 1, NULL, 0, capacity),
>      x: present in 221 parsing errors
>      example:
>                 Int128 a = expand(x);
>                 Int128 r = int128_rshift(a, n);
>                 g_assert_cmpuint(r.lo, ==, l);
>                 g_assert_cmpuint(r.hi, ==, h);
>      a: present in 197 parsing errors
>      example:
>                 vmstate_load_state(loading, &vmstate_skipping, &obj, 2);
>                 g_assert(!qemu_file_get_error(loading));
>                 g_assert_cmpint(obj.a, ==, 10);
>                 g_assert_cmpint(obj.b, ==, 20);
>
> After:
>
>      -----------------------------------------------------------------------
>      maybe 10 most problematic tokens
>      -----------------------------------------------------------------------
>      NULL: present in 506 parsing errors
>      example:
>                 vs->dev = (QVirtioDevice *)dev;
>                 g_assert(dev != NULL);
>                 g_assert_cmphex(vs->dev->device_type, ==, QVIRTIO_SCSI_DEVICE_ID);
>
>      VMStateField: present in 502 parsing errors
>      example:
>                 .version_id = 1,
>                 .minimum_version_id = 1,
>                 .fields = (VMStateField[]) {
>                     VMSTATE_VBUFFER_UINT32(data, Fifo8, 1, NULL, 0, capacity),
>      fields: present in 502 parsing errors
>      example:
>                 .version_id = 1,
>                 .minimum_version_id = 1,
>                 .fields = (VMStateField[]) {
>                     VMSTATE_VBUFFER_UINT32(data, Fifo8, 1, NULL, 0, capacity),
>      minimum_version_id: present in 433 parsing errors
>      example:
>                 .version_id = 1,
>                 .minimum_version_id = 1,
>                 .fields = (VMStateField[]) {
>                     VMSTATE_VBUFFER_UINT32(data, Fifo8, 1, NULL, 0, capacity),
>      env: present in 376 parsing errors
>      example:
>                 int v = float32_compare_quiet(a, b, &env->fp_status);
>                 set_br(env, v != float_relation_greater, br);
>             }
>      version_id: present in 308 parsing errors
>      example:
>                 .version_id = 1,
>                 .minimum_version_id = 1,
>                 .fields = (VMStateField[]) {
>                     VMSTATE_VBUFFER_UINT32(data, Fifo8, 1, NULL, 0, capacity),
>      x: present in 221 parsing errors
>      example:
>                 Int128 a = expand(x);
>                 Int128 r = int128_rshift(a, n);
>                 g_assert_cmpuint(r.lo, ==, l);
>                 g_assert_cmpuint(r.hi, ==, h);
>      a: present in 197 parsing errors
>      example:
>                 vmstate_load_state(loading, &vmstate_skipping, &obj, 2);
>                 g_assert(!qemu_file_get_error(loading));
>                 g_assert_cmpint(obj.a, ==, 10);
>                 g_assert_cmpint(obj.b, ==, 20);
>      b: present in 164 parsing errors
>      example:
>                     uint64_t rl, rh;
>                     muls64(&rl, &rh, test_s_data[i].a, test_s_data[i].b);
>                     g_assert_cmpuint(rl, ==, test_s_data[i].rl);
>                     g_assert_cmpint(rh, ==, test_s_data[i].rh);
>      name: present in 150 parsing errors
>      example:
>                 g_assert(list != NULL);
>                 g_assert(QTAILQ_EMPTY(&list->head));
>                 g_assert_cmpstr(list->name, ==, "opts_list_01");
>
>      -----------------------------------------------------------------------
>
> Clearly visible is the effect of your cocci-macro-file.h's glue() .
>
>> ---
>>   scripts/cocci-macro-file.h | 119 +++++++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 119 insertions(+)
>>   create mode 100644 scripts/cocci-macro-file.h
>>
>> diff --git a/scripts/cocci-macro-file.h b/scripts/cocci-macro-file.h
>> new file mode 100644
>> index 0000000..eceb4be
>> --- /dev/null
>> +++ b/scripts/cocci-macro-file.h
>> @@ -0,0 +1,119 @@
>> +/* Macro file for Coccinelle
>> + *
>> + * Copyright (C) 2015 Red Hat, Inc.
>> + *
>> + * Authors:
>> + *  Paolo Bonzini <pbonzini@redhat.com>
>> + *
>> + * This work is licensed under the terms of the GNU GPL, version 2 or, at your
>> + * option, any later version.  See the COPYING file in the top-level directory.
>> + */
>> +
>> +/* Coccinelle only does limited parsing of headers, and chokes on some idioms
>> + * defined in compiler.h and queue.h.  Macros that Coccinelle must know about
>> + * in order to parse .c files must be in a separate macro file---which is
>> + * exactly what you're staring at now.
>> + *
>> + * To use this file, add the "--macro-file scripts/cocci-macro-file.h" to the
>> + * Coccinelle command line.
>> + */
>> +
>> +/* From qemu/compiler.h */
>> +#define QEMU_GNUC_PREREQ(maj, min) 1
>> +#define QEMU_NORETURN __attribute__ ((__noreturn__))
>> +#define QEMU_WARN_UNUSED_RESULT __attribute__((warn_unused_result))
>> +#define QEMU_SENTINEL __attribute__((sentinel))
>> +#define QEMU_ARTIFICIAL __attribute__((always_inline, artificial))
>> +#define QEMU_PACKED __attribute__((gcc_struct, packed))
>> +
>> +#define cat(x,y) x ## y
>> +#define cat2(x,y) cat(x,y)
>
> Why not reuse glue()?
>
>> +#define QEMU_BUILD_BUG_ON(x) \
>> + typedef char cat2(qemu_build_bug_on__,__LINE__)[(x)?-1:1]
>> __attribute__((unused));
>> +
>> +#define GCC_FMT_ATTR(n, m) __attribute__((format(gnu_printf, n, m)))
>> +
>> +#define xglue(x, y) x ## y
>> +#define glue(x, y) xglue(x, y)
>> +#define stringify(s)	tostring(s)
>> +#define tostring(s)	#s
>> +
>> +#define typeof_field(type, field) typeof(((type *)0)->field)
>> +#define type_check(t1,t2) ((t1*)0 - (t2*)0)
>> +
> [...]
>
> Preferably with cat2() replaced by glue():
> Reviewed-by: Markus Armbruster <armbru@redhat.com>
>


