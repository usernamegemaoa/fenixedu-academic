update FF$DOMAIN_CLASS_INFO set DOMAIN_CLASS_NAME = "net.sourceforge.fenixedu.domain.inquiries.InquiryStudentTeacherAnswer" where DOMAIN_CLASS_ID = 1374;
update INQUIRY_ANSWER set OJB_CONCRETE_CLASS = "net.sourceforge.fenixedu.domain.inquiries.InquiryStudentTeacherAnswer" where OJB_CONCRETE_CLASS = "net.sourceforge.fenixedu.domain.inquiries.InquiryTeacherAnswer";