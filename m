Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iIWZk-0006GJ-TY
	for mharc-qemu-trivial@gnu.org; Thu, 10 Oct 2019 07:25:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49082)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1iIWZi-0006Fq-7S
 for qemu-trivial@nongnu.org; Thu, 10 Oct 2019 07:25:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1iIWZg-00032b-VT
 for qemu-trivial@nongnu.org; Thu, 10 Oct 2019 07:25:42 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54296)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1iIWZg-00032I-Kf
 for qemu-trivial@nongnu.org; Thu, 10 Oct 2019 07:25:40 -0400
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 9581B81F13
 for <qemu-trivial@nongnu.org>; Thu, 10 Oct 2019 11:25:39 +0000 (UTC)
Received: by mail-wm1-f72.google.com with SMTP id m16so1646479wmg.8
 for <qemu-trivial@nongnu.org>; Thu, 10 Oct 2019 04:25:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cyULpBRSWpnnsFjoZQWdCgC2kvCpR9QQOdLsWFdm+os=;
 b=ASXqVMF/S4ccwjjEBaSwvvoC5UAW5v1VVaQkUGxZQ+phcvwzSsRSiC78ezJoNr87w9
 pfAoLLjvOz8lYjzEQ/WAEuYt6VKMqdqrFYFJrew7FLXtcXDqonVwgG9eObjjf3T1iwao
 R/x8NFUh8e0apEjyEEfE+XiDcxOVUIqfGRBcAqqE78nX8vf1Lkhc+RP3j3/9/Ek4GjQe
 OmXuP/QAHDi8zEXrpi4evBhwiBUTWdsYrCZd61UehGKYE4I5UprFOR2ml7fW2io9zSoQ
 QrA83W4HGD3lC4lMSs6bGwMT9aGaA8jT1HS44QCM18dNIHsc7/JgdwQP1/wlswOXuH0o
 Aabw==
X-Gm-Message-State: APjAAAWzBgSC/7BjQ/ubJqbWtiDY2o1GITliGqG7D6FSGqOW+bUfrZjz
 SzQuLld0jsdOT7virsZCL4zyALifRhjbO3YesYpeoi0PqVsn8ihtmvRREVrueUwPGb9KGh+TuqH
 vjdSK0/SeG9FGZRS4Pw==
X-Received: by 2002:adf:b69f:: with SMTP id j31mr7977110wre.277.1570706738086; 
 Thu, 10 Oct 2019 04:25:38 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwL23c1U38DP1Z+PhTkmWEsXAQXF0lt6yd7YjI+CyVhPlgxI1hA+gg7xgfgnj9NmNEhsbOhyw==
X-Received: by 2002:adf:b69f:: with SMTP id j31mr7977085wre.277.1570706737761; 
 Thu, 10 Oct 2019 04:25:37 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:ddc7:c53c:581a:7f3e?
 ([2001:b07:6468:f312:ddc7:c53c:581a:7f3e])
 by smtp.gmail.com with ESMTPSA id l7sm5991494wrv.77.2019.10.10.04.25.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Oct 2019 04:25:37 -0700 (PDT)
Subject: Re: [PATCHv2 1/2] util/qemu-error: add guest name helper with -msg
 options
To: Markus Armbruster <armbru@redhat.com>,
 Mario Smarduch <msmarduch@digitalocean.com>
Cc: philmd@redhat.com, mtosatti@redhat.com, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org, rth@twiddle.net, ehabkost@redhat.com
References: <20191009164459.8209-1-msmarduch@digitalocean.com>
 <20191009164459.8209-2-msmarduch@digitalocean.com>
 <87y2xtt3qb.fsf@dusky.pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <3861181c-cffb-91d7-f3c1-f51dd8649cc1@redhat.com>
Date: Thu, 10 Oct 2019 13:25:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <87y2xtt3qb.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 10 Oct 2019 11:25:43 -0000

[Sorry Markus, I missed this message before]

On 10/10/19 10:16, Markus Armbruster wrote:
> I don't think merging this via qemu-trivial is a good idea.  First, it's
> not sufficiently trivial, as we shall see below.  Second, the code in
> question has a maintainer willing to review and merge patches: me.  I
> can't always review as quickly as we all would like; sorry about that.

Yes, it's not trivial indeed.

I think I can pick up v2 2/2 separately.  Since I had already started 
working on resolving conflicts before seeing your reply, I will leave
here my resulting patch, for Mario to pick up.

diff --git a/include/qemu/error-report.h b/include/qemu/error-report.h
index 87532d8596..4d3ee6f00c 100644
--- a/include/qemu/error-report.h
+++ b/include/qemu/error-report.h
@@ -75,5 +75,6 @@ void error_init(const char *argv0);
 const char *error_get_progname(void);
 
 extern bool error_with_timestamp;
+extern bool error_with_guest_name;
 
 #endif
diff --git a/qemu-options.hx b/qemu-options.hx
index 158244da0f..70a76069a6 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -4164,17 +4164,20 @@ HXCOMM Deprecated by -accel tcg
 DEF("no-kvm", 0, QEMU_OPTION_no_kvm, "", QEMU_ARCH_I386)
 
 DEF("msg", HAS_ARG, QEMU_OPTION_msg,
-    "-msg timestamp[=on|off]\n"
-    "                control error message format\n"
-    "                timestamp=on enables timestamps (default: off)\n",
+    "-msg [timestamp=on|off][,name=on|off]\n"
+    "                change the format of messages\n"
+    "                timestamp=on|off prepend timestamps (default: off)\n"
+    "                name=on|off prepend guest name (default: off)\n",
     QEMU_ARCH_ALL)
 STEXI
-@item -msg timestamp[=on|off]
+@item -msg
 @findex -msg
 Control error message format.
 @table @option
 @item timestamp=on|off
 Prefix messages with a timestamp.  Default is off.
+@item name=on|off
+Prefix messages with the name of the guest.  Default is off.
 @end table
 ETEXI
 
diff --git a/util/qemu-error.c b/util/qemu-error.c
index dac7c7dc50..497217298f 100644
--- a/util/qemu-error.c
+++ b/util/qemu-error.c
@@ -11,6 +11,8 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/option.h"
+#include "qemu/config-file.h"
 #include "monitor/monitor.h"
 #include "qemu/error-report.h"
 
@@ -27,6 +29,9 @@ typedef enum {
 /* Prepend timestamp to messages */
 bool error_with_timestamp;
 
+/* Prepend guest name to messages */
+bool error_with_guest_name;
+
 int error_printf(const char *fmt, ...)
 {
     va_list ap;
@@ -230,6 +235,27 @@ static void vreport(report_type type, const char *fmt, va_list ap)
     error_printf("\n");
 }
 
+static const char *error_get_guest_name(void)
+{
+    QemuOpts *opts = qemu_opts_find(qemu_find_opts("name"), NULL);
+    return qemu_opt_get(opts, "guest");
+}
+
+/*
+ * Also print the guest name, handy if we log to a server.
+ */
+static void error_print_guest_name(void)
+{
+    const char *name;
+
+    if (error_with_guest_name) {
+        name = error_get_guest_name();
+        if (name && !cur_mon) {
+            error_printf("Guest [%s] ", name);
+        }
+    }
+}
+
 /*
  * Print an error message to current monitor if we have one, else to stderr.
  * Format arguments like vsprintf().  The resulting message should be
@@ -239,6 +265,7 @@ static void vreport(report_type type, const char *fmt, va_list ap)
  */
 void error_vreport(const char *fmt, va_list ap)
 {
+    error_print_guest_name();
     vreport(REPORT_TYPE_ERROR, fmt, ap);
 }
 
@@ -250,6 +277,7 @@ void error_vreport(const char *fmt, va_list ap)
  */
 void warn_vreport(const char *fmt, va_list ap)
 {
+    error_print_guest_name();
     vreport(REPORT_TYPE_WARNING, fmt, ap);
 }
 
@@ -276,6 +304,7 @@ void error_report(const char *fmt, ...)
 {
     va_list ap;
 
+    error_print_guest_name();
     va_start(ap, fmt);
     vreport(REPORT_TYPE_ERROR, fmt, ap);
     va_end(ap);
@@ -291,6 +320,7 @@ void warn_report(const char *fmt, ...)
 {
     va_list ap;
 
+    error_print_guest_name();
     va_start(ap, fmt);
     vreport(REPORT_TYPE_WARNING, fmt, ap);
     va_end(ap);
@@ -326,6 +356,7 @@ bool error_report_once_cond(bool *printed, const char *fmt, ...)
         return false;
     }
     *printed = true;
+    error_print_guest_name();
     va_start(ap, fmt);
     vreport(REPORT_TYPE_ERROR, fmt, ap);
     va_end(ap);
@@ -346,6 +377,7 @@ bool warn_report_once_cond(bool *printed, const char *fmt, ...)
         return false;
     }
     *printed = true;
+    error_print_guest_name();
     va_start(ap, fmt);
     vreport(REPORT_TYPE_WARNING, fmt, ap);
     va_end(ap);
diff --git a/vl.c b/vl.c
index b8e4c11f02..b6f870f079 100644
--- a/vl.c
+++ b/vl.c
@@ -417,6 +417,10 @@ static QemuOptsList qemu_msg_opts = {
             .name = "timestamp",
             .type = QEMU_OPT_BOOL,
         },
+        {
+            .name = "name",
+            .type = QEMU_OPT_BOOL,
+        },
         { /* end of list */ }
     },
 };
@@ -1263,6 +1267,7 @@ static void realtime_init(void)
 static void configure_msg(QemuOpts *opts)
 {
     error_with_timestamp = qemu_opt_get_bool(opts, "timestamp", false);
+    error_with_guest_name = qemu_opt_get_bool(opts, "name", false);
 }
 
 
Paolo

