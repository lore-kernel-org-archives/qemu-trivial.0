Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZZGnN-0007z4-86
	for mharc-qemu-trivial@gnu.org; Tue, 08 Sep 2015 07:10:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50462)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1ZZGnE-0007sK-97
	for qemu-trivial@nongnu.org; Tue, 08 Sep 2015 07:10:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1ZZGn7-0007BG-B7
	for qemu-trivial@nongnu.org; Tue, 08 Sep 2015 07:10:27 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60555)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1ZZGmz-00075z-1J; Tue, 08 Sep 2015 07:10:13 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (Postfix) with ESMTPS id 990398EA3A;
	Tue,  8 Sep 2015 11:10:12 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-30.ams2.redhat.com
	[10.36.116.30])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t88BAApA015278
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Tue, 8 Sep 2015 07:10:11 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id E064B300111B; Tue,  8 Sep 2015 13:10:09 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
References: <1441621264-23812-1-git-send-email-pbonzini@redhat.com>
Date: Tue, 08 Sep 2015 13:10:09 +0200
In-Reply-To: <1441621264-23812-1-git-send-email-pbonzini@redhat.com> (Paolo
	Bonzini's message of "Mon, 7 Sep 2015 12:21:04 +0200")
Message-ID: <87h9n5p3ou.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] add macro file for
	coccinelle
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
X-List-Received-Date: Tue, 08 Sep 2015 11:10:33 -0000

Paolo Bonzini <pbonzini@redhat.com> writes:

> Coccinelle chokes on some idioms from compiler.h and queue.h.
> Extract those in a macro file, to be used with "--macro-file
> scripts/cocci-macro-file.h".
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

I tested this as follows.  Coccinelle can report on its parsing
difficulties:

$ spatch --parse-c `git-ls-files | grep '\.c$'

Requires a generous ulimit -s, and produces tons of output.  The
interesting part here is the summary at the end:

    NB total files = 1923; perfect = 1377; pbs = 545; timeout = 0; =========> 71%
    nb good = 964472,  nb passed = 14824 =========> 1.48% passed
    nb good = 964472,  nb bad = 23759 =========> 97.63% good or passed


Repeat with --macro-file scripts/cocci-macro-file.h.

    NB total files = 1923; perfect = 1463; pbs = 459; timeout = 0; =========> 76%
    nb good = 910559,  nb passed = 15352 =========> 1.53% passed
    nb good = 910559,  nb bad = 77610 =========> 92.27% good or passed

The first line shows clear improvement: 86 more files are now deemed
"perfect".  I'm not sure how to read the remaining two lines.

Also interesting are the "maybe 10 most problematic tokens".  Before:

    -----------------------------------------------------------------------
    maybe 10 most problematic tokens
    -----------------------------------------------------------------------
    glue: present in 620 parsing errors
    example: 

           #define OP_32_64(x)                             \
                   glue(glue(case INDEX_op_, x), _i32):    \
                   glue(glue(case INDEX_op_, x), _i64)
    NULL: present in 507 parsing errors
    example: 
               vs->dev = (QVirtioDevice *)dev;
               g_assert(dev != NULL);
               g_assert_cmphex(vs->dev->device_type, ==, QVIRTIO_SCSI_DEVICE_ID);

    VMStateField: present in 502 parsing errors
    example: 
               .version_id = 1,
               .minimum_version_id = 1,
               .fields = (VMStateField[]) {
                   VMSTATE_VBUFFER_UINT32(data, Fifo8, 1, NULL, 0, capacity),
    fields: present in 502 parsing errors
    example: 
               .version_id = 1,
               .minimum_version_id = 1,
               .fields = (VMStateField[]) {
                   VMSTATE_VBUFFER_UINT32(data, Fifo8, 1, NULL, 0, capacity),
    minimum_version_id: present in 433 parsing errors
    example: 
               .version_id = 1,
               .minimum_version_id = 1,
               .fields = (VMStateField[]) {
                   VMSTATE_VBUFFER_UINT32(data, Fifo8, 1, NULL, 0, capacity),
    uint32_t: present in 414 parsing errors
    example: 
                                       uint32_t *bg, uint32_t *fg,                 \
                                       VncPalette **palette) {                     \
                   uint##bpp##_t *data;                                            \
                   uint##bpp##_t c0, c1, ci;                                       \
    env: present in 400 parsing errors
    example: 
               int v = float32_compare_quiet(a, b, &env->fp_status);
               set_br(env, v != float_relation_greater, br);
           }
    version_id: present in 308 parsing errors
    example: 
               .version_id = 1,
               .minimum_version_id = 1,
               .fields = (VMStateField[]) {
                   VMSTATE_VBUFFER_UINT32(data, Fifo8, 1, NULL, 0, capacity),
    x: present in 221 parsing errors
    example: 
               Int128 a = expand(x);
               Int128 r = int128_rshift(a, n);
               g_assert_cmpuint(r.lo, ==, l);
               g_assert_cmpuint(r.hi, ==, h);
    a: present in 197 parsing errors
    example: 
               vmstate_load_state(loading, &vmstate_skipping, &obj, 2);
               g_assert(!qemu_file_get_error(loading));
               g_assert_cmpint(obj.a, ==, 10);
               g_assert_cmpint(obj.b, ==, 20);

After:

    -----------------------------------------------------------------------
    maybe 10 most problematic tokens
    -----------------------------------------------------------------------
    NULL: present in 506 parsing errors
    example: 
               vs->dev = (QVirtioDevice *)dev;
               g_assert(dev != NULL);
               g_assert_cmphex(vs->dev->device_type, ==, QVIRTIO_SCSI_DEVICE_ID);

    VMStateField: present in 502 parsing errors
    example: 
               .version_id = 1,
               .minimum_version_id = 1,
               .fields = (VMStateField[]) {
                   VMSTATE_VBUFFER_UINT32(data, Fifo8, 1, NULL, 0, capacity),
    fields: present in 502 parsing errors
    example: 
               .version_id = 1,
               .minimum_version_id = 1,
               .fields = (VMStateField[]) {
                   VMSTATE_VBUFFER_UINT32(data, Fifo8, 1, NULL, 0, capacity),
    minimum_version_id: present in 433 parsing errors
    example: 
               .version_id = 1,
               .minimum_version_id = 1,
               .fields = (VMStateField[]) {
                   VMSTATE_VBUFFER_UINT32(data, Fifo8, 1, NULL, 0, capacity),
    env: present in 376 parsing errors
    example: 
               int v = float32_compare_quiet(a, b, &env->fp_status);
               set_br(env, v != float_relation_greater, br);
           }
    version_id: present in 308 parsing errors
    example: 
               .version_id = 1,
               .minimum_version_id = 1,
               .fields = (VMStateField[]) {
                   VMSTATE_VBUFFER_UINT32(data, Fifo8, 1, NULL, 0, capacity),
    x: present in 221 parsing errors
    example: 
               Int128 a = expand(x);
               Int128 r = int128_rshift(a, n);
               g_assert_cmpuint(r.lo, ==, l);
               g_assert_cmpuint(r.hi, ==, h);
    a: present in 197 parsing errors
    example: 
               vmstate_load_state(loading, &vmstate_skipping, &obj, 2);
               g_assert(!qemu_file_get_error(loading));
               g_assert_cmpint(obj.a, ==, 10);
               g_assert_cmpint(obj.b, ==, 20);
    b: present in 164 parsing errors
    example: 
                   uint64_t rl, rh;
                   muls64(&rl, &rh, test_s_data[i].a, test_s_data[i].b);
                   g_assert_cmpuint(rl, ==, test_s_data[i].rl);
                   g_assert_cmpint(rh, ==, test_s_data[i].rh);
    name: present in 150 parsing errors
    example: 
               g_assert(list != NULL);
               g_assert(QTAILQ_EMPTY(&list->head));
               g_assert_cmpstr(list->name, ==, "opts_list_01");

    -----------------------------------------------------------------------

Clearly visible is the effect of your cocci-macro-file.h's glue() .

> ---
>  scripts/cocci-macro-file.h | 119 +++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 119 insertions(+)
>  create mode 100644 scripts/cocci-macro-file.h
>
> diff --git a/scripts/cocci-macro-file.h b/scripts/cocci-macro-file.h
> new file mode 100644
> index 0000000..eceb4be
> --- /dev/null
> +++ b/scripts/cocci-macro-file.h
> @@ -0,0 +1,119 @@
> +/* Macro file for Coccinelle
> + *
> + * Copyright (C) 2015 Red Hat, Inc.
> + *
> + * Authors:
> + *  Paolo Bonzini <pbonzini@redhat.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or, at your
> + * option, any later version.  See the COPYING file in the top-level directory.
> + */
> +
> +/* Coccinelle only does limited parsing of headers, and chokes on some idioms
> + * defined in compiler.h and queue.h.  Macros that Coccinelle must know about
> + * in order to parse .c files must be in a separate macro file---which is
> + * exactly what you're staring at now.
> + *
> + * To use this file, add the "--macro-file scripts/cocci-macro-file.h" to the
> + * Coccinelle command line.
> + */
> +
> +/* From qemu/compiler.h */
> +#define QEMU_GNUC_PREREQ(maj, min) 1
> +#define QEMU_NORETURN __attribute__ ((__noreturn__))
> +#define QEMU_WARN_UNUSED_RESULT __attribute__((warn_unused_result))
> +#define QEMU_SENTINEL __attribute__((sentinel))
> +#define QEMU_ARTIFICIAL __attribute__((always_inline, artificial))
> +#define QEMU_PACKED __attribute__((gcc_struct, packed))
> +
> +#define cat(x,y) x ## y
> +#define cat2(x,y) cat(x,y)

Why not reuse glue()?

> +#define QEMU_BUILD_BUG_ON(x) \
> + typedef char cat2(qemu_build_bug_on__,__LINE__)[(x)?-1:1]
> __attribute__((unused));
> +
> +#define GCC_FMT_ATTR(n, m) __attribute__((format(gnu_printf, n, m)))
> +
> +#define xglue(x, y) x ## y
> +#define glue(x, y) xglue(x, y)
> +#define stringify(s)	tostring(s)
> +#define tostring(s)	#s
> +
> +#define typeof_field(type, field) typeof(((type *)0)->field)
> +#define type_check(t1,t2) ((t1*)0 - (t2*)0)
> +
[...]

Preferably with cat2() replaced by glue():
Reviewed-by: Markus Armbruster <armbru@redhat.com>

