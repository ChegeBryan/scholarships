import 'package:geopro/models/faq.dart';

List faqs = [
  {
    "question": "How to create a ticket?",
    "answer":
        "1. Click on the ticketing icon on the dashboard.\n2. To add a new ticket. Click on the ➕ button on the bottom right of the screen.\n3. Fill in all the required fields and Click on the save button on the bottom right of the screen.",
    "images": [],
    "category": "Ticketing"
  },
  {
    "question": "How to start and mark a ticket as resolved?",
    "answer": "A ticket is marked as resolved after the task is completed.",
    "images": [],
    "category": "Ticketing"
  },
  {
    "question": "How to comment on ticket progress?",
    "answer":
        "If you have comment concerning a ticket. Click on the bottom navigation bar, this will navigate you to the comment screen. Type your comment then click on the button below the text field to save.",
    "images": [],
    "category": "Ticketing"
  },
  {
    "question": "How to fill in Safety forms?",
    "answer":
        "STEPS FOR TECHNICIANS.\n1. After creating a ticket. Click on safety icon on the dashboard.\n2. Locate the ticket number that was generated when you created a ticket and click on it.\n3. A list of ohs forms will be displayed under the ticket you created.\n4. Each form will display a green tick ✅ on the far right indicating the form has been filled. A red x ❌ icon indicating the form has not been filled.\n5. Click on each form one by one to fill in the details. Make sure to fill in the required fields on each form. The forms to fill as technicians: Job Hazard Analysis, Toolbox talks, Personal Protective Equipment, Site Safety Equipment, Site Safety Equipment.\n6. After filling the forms on step 4. Your safety officer will approve or reject any of the forms. When they reject, they will comment why it was rejected.\n7. When the OHS is approved, you will know be able to fill in the permit to work.\n\nSTEPS FOR SAFETY OFFICERS.\n1. After logging in into the app, you can access the safety module by either click the dashboard and click the safety icon. Or open the side menu, click the safety button which will display jobs/Tickets.\n2. Each form will display a green tick ✅ on the far right indicating the form has been filled. A red x ❌ icon indicating the form has not been filled.\n3. Click the on jobs/Tickets. This will open and display the OHS forms.\n4. Click on the technician's ticket you want. Review the OHS forms the technician filled and approve or reject (give a reason why the ohs was rejected).",
    "images": [],
    "category": "Safety"
  },
  {
    "question": "How to capture casuals and their photos?",
    "answer":
        "STEPS:\n1. You can access the casual module by either going to the dashboard and clicking the casual icon. Or open the side menu, click on the casuals, then the casual reports.\n2. To add a new casual. Click on the ➕ button on the bottom right of the screen.\n3. Click on the ➕ button on the upper right of the screen, to add the casual details.\n4. A pop window will appear. Fill the details and click the save button below the pop-up window that will redirect you to the casual report page. Then click the save button again on the casual report page on the button right corner.",
    "images": [],
    "category": "Casuals"
  },
  {
    "question": "How to attach a casual report?",
    "answer":
        "1. Whilst in the casual report page, click on the icon to your right of the bottom bar. This will redirect you to a page where to attach a casual report file.\n2. Click on the camera 📷 like icon, allow the Erp to access your gallery. Pick the file/image you want. Then click save the button.",
    "images": [],
    "category": "Casuals"
  }
];

class FaqList {
  // get faqs
  List<Faq> getFaqs() {
    return faqs.map((json) => Faq.fromJson(json)).toList();
  }

  List<Faq> getFaqsByCategory(String category) {
    List filtered = faqs
        .where((item) => item['category'].toLowerCase() == category)
        .toList();

    return filtered.map((json) => Faq.fromJson(json)).toList();
  }
}
